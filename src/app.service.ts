import { BadRequestException, Injectable } from '@nestjs/common';
import { DatabaseService } from './database/database.service';

@Injectable()
export class AppService {

    private readonly MS_PER_DAY = 1000 * 60 * 60 * 24;
    private readonly WEEKENDS = [0, 6]; // Sunday(0), Saturday(6)

    constructor(
        private readonly dbService: DatabaseService
    ) { }

    public async createOrder(carId: number, rateId: number, days: number): Promise<object> {
        if (days > 30)
            throw new BadRequestException('Cannot order more than 30 days')

        const now = new Date();
        const end = new Date();

        end.setDate(end.getDate() + days);

        const lastOrder = await this.getLastOrderOfCar(carId);

        if (lastOrder) {
            if (lastOrder.date.end > now)
                throw new BadRequestException('Car already ordered');

            if (now.getTime() - lastOrder.date.end.getTime() < this.MS_PER_DAY * 3)
                throw new BadRequestException('Cannot order this car, it\'s paused for 3 days');
        }

        if (this.WEEKENDS.includes(now.getDay()) || this.WEEKENDS.includes(end.getDay()))
            throw new BadRequestException('Order cannot start or end on weekends');

        const car = !!lastOrder ? lastOrder.car : await this.getCar(carId);
        const rate = await this.getRate(rateId);

        let cost = rate.price * days;

        // could have been better
        if (days >= 3 && days <= 5) cost = cost - (cost * 0.05);
        if (days > 5 && days < 15) cost = cost - (cost * 0.10);
        if (days >= 15 && days <= 30) cost = cost - (cost * 0.15);

        const query = 'INSERT INTO orders (car, rate, cost, date_start, date_end) VALUES ($1, $2, $3, $4, $5) RETURNING *';

        const result = await this.dbService.getPool().query(query, [car.id, rate.id, cost, now, end]);

        return result.rows[0];
    }

    public async getAverageOrdersDuration(): Promise<Date> {
        const query = 'SELECT AVG(date_end - date_start) AS duration FROM orders';
        
        const result = await this.dbService.getPool().query(query);

        return result.rows[0];
    }

    public async getAverageOrdersDurationForCar(carId: number): Promise<Date> {
        const query = 'SELECT AVG(date_end - date_start) AS duration FROM orders WHERE orders.car = $1';
        
        const result = await this.dbService.getPool().query(query, [carId]);

        return result.rows[0];
    }

    public async getAvailableCars(): Promise<Car[]> {
        // (OR orders.id IS NULL) - equivalent to no orders for car
        const query = 'SELECT cars.* from cars FULL OUTER JOIN orders ON cars.id = orders.car WHERE (orders.date_end < NOW() OR orders.id IS NULL)';

        const result = await this.dbService.getPool().query(query);

        return <Car[]>result.rows; // Response from DB is similar with Car object
    }

    public async getAllOrders(): Promise<Order[]> {
        const query = 'SELECT orders.id, orders.cost, rates.id AS "rate.id", rates.mileage AS "rate.mileage", rates.price AS "rate.price", orders.date_start AS "date.start", orders.date_end AS "date.end", cars.id AS "car.id", cars.brand AS "car.brand", cars.model AS "car.model", cars.vrp AS "car.vrp", cars.vin AS "car.vin" FROM orders LEFT JOIN rates ON orders.rate = rates.id LEFT JOIN cars ON orders.car = cars.id';

        const result = await this.dbService.getPool().query(query);

        return result.rows.map((row) => this.serializeOrder(row));
    }

    public async getActiveOrders(): Promise<Order[]> {
        const query = 'SELECT orders.id, orders.cost, rates.id AS "rate.id", rates.mileage AS "rate.mileage", rates.price AS "rate.price", orders.date_start AS "date.start", orders.date_end AS "date.end", cars.id AS "car.id", cars.brand AS "car.brand", cars.model AS "car.model", cars.vrp AS "car.vrp", cars.vin AS "car.vin" FROM orders LEFT JOIN rates ON orders.rate = rates.id LEFT JOIN cars ON orders.car = cars.id WHERE orders.date_start <= NOW() AND orders.date_end >= NOW()';

        const result = await this.dbService.getPool().query(query);

        const orders = result.rows.map((row) => this.serializeOrder(row));

        return orders;
    }

    public async getLastOrderOfCar(carId: number): Promise<Order> {
        const query = 'SELECT orders.id, orders.cost, rates.id AS "rate.id", rates.mileage AS "rate.mileage", rates.price AS "rate.price", orders.date_start AS "date.start", orders.date_end AS "date.end", cars.id AS "car.id", cars.brand AS "car.brand", cars.model AS "car.model", cars.vrp AS "car.vrp", cars.vin AS "car.vin" FROM orders LEFT JOIN rates ON orders.rate = rates.id LEFT JOIN cars ON orders.car = cars.id WHERE car = $1 ORDER BY date_end DESC LIMIT 1';

        const result = await this.dbService.getPool().query(query, [carId]);

        const orderRow = result.rows[0];

        if (!orderRow) return undefined;

        const order = this.serializeOrder(orderRow);

        return order;
    }

    private async getCar(carId: number): Promise<Car> {
        const query = 'SELECT * FROM cars WHERE id = $1';

        const result = await this.dbService.getPool().query(query, [carId]);

        const car = result.rows[0];

        if (!car) throw new BadRequestException('Car not found');

        return car;
    }

    private async getRate(rateId: number): Promise<Rate> {
        const query = 'SELECT * FROM rates WHERE id = $1';

        const result = await this.dbService.getPool().query(query, [rateId]);

        const rate = result.rows[0];

        if (!rate) throw new BadRequestException('Rate not found');

        return rate;
    }

    private serializeOrder(orderRow: any): Order {
        const order = <Order>{ car: {}, rate: {}, date: {} };

        // because i cannot use ORM :D
        order.id = orderRow.id;
        order.cost = orderRow.cost;

        order.car.id = orderRow['car.id'];
        order.car.brand = orderRow['car.brand'];
        order.car.model = orderRow['car.model'];
        order.car.vrp = orderRow['car.vrp'];
        order.car.vin = orderRow['car.vin'];

        order.rate.id = orderRow['rate.id'];
        order.rate.mileage = orderRow['rate.mileage'];
        order.rate.price = orderRow['rate.price'];

        order.date.start = orderRow['date.start'];
        order.date.end = orderRow['date.end'];

        return order;
    }

}
