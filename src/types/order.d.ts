declare interface Order {
    id: number,
    car: Car,
    rate: Rate,
    date: {
        start: Date,
        end: Date
    },
    cost: number
}