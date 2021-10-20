import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Pool, PoolClient } from 'pg';

@Injectable()
export class DatabaseService {

    private dbPool: Pool;

    constructor(
        private readonly configService: ConfigService
    ) { }

    private createPool(): void {
        this.dbPool = new Pool({
            user: this.configService.get<string>('db.user'),
            password: this.configService.get<string>('db.password'),
            host: this.configService.get<string>('db.host'),
            port: this.configService.get<number>('db.port'),
            database: this.configService.get<string>('db.name')
        });

        // TODO Remove this
        this.dbPool.on('connect', (client: PoolClient) => {
        });

        this.dbPool.on('error', (err: Error, client: PoolClient) => {
            console.error(err);
        });
    }

    public getPool(): Pool {
        if (!this.dbPool) this.createPool();

        return this.dbPool;
    }

}
