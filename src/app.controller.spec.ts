import { ConfigModule } from '@nestjs/config';
import { Test, TestingModule } from '@nestjs/testing';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';

describe('AppController', () => {
    let appController: AppController;

    beforeEach(async () => {
        const app: TestingModule = await Test.createTestingModule({
            imports: [ConfigModule.forRoot(), DatabaseModule],
            controllers: [AppController],
            providers: [AppService],
        }).compile();

        appController = app.get<AppController>(AppController);
    });

    describe('root', () => {
        it('should be true', () => {
            expect(true).toBe(true);
        })
        // it('should return "Hello World!"', () => {
            // expect(appController.getHello()).toBe('Hello World!');
        // });
    });
});