import { ConfigModule, ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const config: ConfigService = app.get(ConfigService);

  const bindPort = config.get<number>('web.bind.port') || 8080;
  const bindHost = config.get<string>('web.bind.host') || '127.0.0.1';

  await app.listen(bindPort, bindHost);
}
bootstrap();
