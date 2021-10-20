import { Test, TestingModule } from '@nestjs/testing';
import { DatabaseService } from './database.service';
import { ConfigModule } from '@nestjs/config';

describe('DatabaseService', () => {
    let service: DatabaseService;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            imports: [ConfigModule.forRoot()],
            providers: [DatabaseService],
        }).compile();

        service = module.get<DatabaseService>(DatabaseService);
    });

    it('pool should be defined', () => {
        expect(service.getPool()).toBeDefined();
    });

    it('query result should be 1', async () => {
        const result = await service.getPool().query('SELECT 1 AS result');

        expect(result.rows[0].result).toEqual(1);
    });

    
});
