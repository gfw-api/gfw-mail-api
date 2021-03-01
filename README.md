# Global Forest Watch Mail API

[![Build Status](https://travis-ci.com/gfw-api/gfw-mail-api.svg?branch=develop)](https://travis-ci.com/gfw-api/gfw-mail-api)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a4f13ba330b5d5573d7a/test_coverage)](https://codeclimate.com/github/gfw-api/gfw-mail-api/test_coverage)

This repository is the microservice that send the emails.

[View the documentation for this
API](http://gfw-api.github.io/swagger-ui/?url=https://raw.githubusercontent.com/gfw-api/gfw-mail-api/production/app/microservice/swagger.yml#/Mail)

1. [Getting Started](#getting-started)
2. [Deployment](#deployment)

## Getting Started

**First, make sure that you have the [API gateway running
locally](https://github.com/Vizzuality/api-gateway/tree/production#getting-started).**

Start by cloning the repository from github to your execution environment

```
git clone https://github.com/gfw-api/gfw-mail-api.git && cd gfw-mail-api
```

After that, follow one of the instructions below:

### Using native execution

1 - Set up your environment variables. See `dev.env.sample` for a list of variables you should set, which are described in detail in [this section](#environment-variables) of the documentation. Native execution will NOT load the `dev.env` file content, so you need to use another way to define those values

2 - Install node dependencies using yarn:
```
yarn
```

3 - Start the application server:
```
yarn start
```

The endpoints provided by this microservice should now be available through Control Tower's URL.

### Using Docker

1 - Create and complete your `dev.env` file with your configuration. You can find an example `dev.env.sample` file in the project root.

2 - Execute the following command to run Control tower:

```
./gfwMailApi.sh develop
```

The endpoints provided by this microservice should now be available through Control Tower's URL.
```

You can now access the microservice through the API gateway.

## Deployment

The application is deployed to Heroku. Setup Heroku for the repository:

```
heroku git:remote -a gfw-mail-api-staging -r staging
```

And deploy as normal:

```
git push staging master
```

### Configuration

It is necessary to define these environment variables:

* API_GATEWAY_URI => Gateway Service API URL
* NODE_ENV => Environment (prod, staging, dev)
* API_GATEWAY_QUEUE_URL => Url of async queue
* API_GATEWAY_QUEUE_PROVIDER => redis (only support redis)
* SELF_REGISTRY => on/off to set auto registry in API Gateway
* SPARKPOST_API_KEY => Sparkpost api key to send emails
