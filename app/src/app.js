// load modules
const config = require('config');
const logger = require('logger');
const koa = require('koa');
const koaLogger = require('koa-logger');
const loader = require('loader');
const validate = require('koa-validate');
const ErrorSerializer = require('serializers/errorSerializer');
const ctRegisterMicroservice = require('ct-register-microservice-node');
const convert = require('koa-convert');
const koaSimpleHealthCheck = require('koa-simple-healthcheck');


// instance of koa
const app = koa();

// if environment is dev then load koa-logger
if (process.env.NODE_ENV === 'dev') {
    logger.debug('Use logger');
    app.use(koaLogger());
}

app.use(function* handleErrors(next) {
    try {
        yield next;
    } catch (inErr) {
        let error = inErr;
        try {
            error = JSON.parse(inErr);
        } catch (e) {
            logger.debug('Could not parse error message - is it JSON?: ', inErr);
            error = inErr;
        }
        this.status = error.status || this.status || 500;
        if (this.status >= 500) {
            logger.error(error);
        } else {
            logger.info(error);
        }

        this.body = ErrorSerializer.serializeError(this.status, error.message);
        if (process.env.NODE_ENV === 'prod' && this.status === 500) {
            this.body = 'Unexpected error';
        }
    }
    this.response.type = 'application/vnd.api+json';
});

// load custom validator
app.use(validate());

app.use(convert.back(koaSimpleHealthCheck()));

// load routes
loader.loadQueues(app);

// Instance of http module
const appServer = require('http').Server(app.callback());

// get port of environment, if not exist obtain of the config.
// In production environment, the port must be declared in environment variable
const port = process.env.PORT || config.get('service.port');

const server = appServer.listen(port, () => {
    ctRegisterMicroservice.register({
        info: require('../microservice/register.json'),
        swagger: require('../microservice/public-swagger.json'),
        mode: (process.env.CT_REGISTER_MODE && process.env.CT_REGISTER_MODE === 'auto') ? ctRegisterMicroservice.MODE_AUTOREGISTER : ctRegisterMicroservice.MODE_NORMAL,
        framework: ctRegisterMicroservice.KOA1,
        app,
        logger,
        name: config.get('service.name'),
        ctUrl: process.env.CT_URL,
        url: process.env.LOCAL_URL,
        token: process.env.CT_TOKEN,
        active: true
    }).then(() => {
    }, (error) => {
        logger.error(error);
        process.exit(1);
    });
});

logger.info(`Server started in port:${port}`);

module.exports = server;
