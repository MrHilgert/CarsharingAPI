import { Controller, Get, Param } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
    constructor(private readonly appService: AppService) { }

    @Get('/averageOrdersDuration')
    public async getAverageOrdersDuration() {
        return this.appService.getAverageOrdersDuration();
    }

    @Get('/averageOrdersDuration/:carId')
    public async getAverageOrdersDurationForCar(@Param('carId') carId: string) {
        return this.appService.getAverageOrdersDurationForCar(parseInt(carId));
    }

    @Get('/allOrders')
    public async getAllOrders() {
        return this.appService.getAllOrders();
    }

    @Get('/availableCars')
    public async getAvailableCars() {
        return this.appService.getAvailableCars();
    }

    @Get('/activeOrders')
    public async getActiveOrders() {
        return this.appService.getActiveOrders();
    }

    @Get('/createOrder/:car/:rate/:days')
    public async createOrder(@Param('car') carId: string, @Param('rate') rate: string, @Param('days') days: string) {
        return this.appService.createOrder(parseInt(carId), parseInt(rate), parseInt(days));
    }

    @Get('/getLastOrder/:carId')
    public getLastOrder(@Param('carId') carId: string) {
        return this.appService.getLastOrderOfCar(parseInt(carId));
    }

}
