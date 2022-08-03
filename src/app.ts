import config from 'config';
import logger from 'logger';
import Koa from 'koa';
import koaLogger from 'koa-logger';
import loadQueues from 'loader';
import ErrorSerializer from 'serializers/error.serializer';
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import koaSimpleHealthCheck from 'koa-simple-healthcheck';
import { Server } from 'http';

interface IInit {
    server: Server;
    app: Koa;
}

const init: () => Promise<IInit> = async (): Promise<IInit> => {
    return new Promise(
        (
            resolve: (value: IInit | PromiseLike<IInit>) => void
        ) => {
            const app: Koa = new Koa();

            if (process.env.NODE_ENV === 'dev') {
                logger.debug('Use logger');
                app.use(koaLogger());
            }

            app.use(koaSimpleHealthCheck());

            // catch errors and send in jsonapi standard. Always return vnd.api+json
            app.use(async (ctx: { status: number; response: { type: string; }; body: any; }, next: () => any) => {
                try {
                    await next();
                } catch (error) {
                    ctx.status = error.status || 500;

                    if (ctx.status >= 500) {
                        logger.error(error);
                    } else {
                        logger.info(error);
                    }

                    if (process.env.NODE_ENV === 'prod' && ctx.status === 500) {
                        ctx.response.type = 'application/vnd.api+json';
                        ctx.body = ErrorSerializer.serializeError(ctx.status, 'Unexpected error');
                        return;
                    }

                    ctx.response.type = 'application/vnd.api+json';
                    ctx.body = ErrorSerializer.serializeError(ctx.status, error.message);
                }
            });

            // load queues
            loadQueues();

            const port: number = parseInt(config.get('service.port'), 10);

            const server: Server = app.listen(port);

            logger.info(`Server started in port:${port}`);
            resolve({ app, server });
        }
    );
};

export { init };
