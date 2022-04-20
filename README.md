# Global Forest Watch Mail API

[![Build Status](https://travis-ci.com/gfw-api/gfw-mail-api.svg?branch=develop)](https://travis-ci.com/gfw-api/gfw-mail-api)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a4f13ba330b5d5573d7a/test_coverage)](https://codeclimate.com/github/gfw-api/gfw-mail-api/test_coverage)

This repository is the microservice that send the emails.

1. [Getting Started](#getting-started)
2. [Deployment](#deployment)

## Getting Started

### OS X

**First, make sure that you have the [API gateway running
locally](https://github.com/Vizzuality/api-gateway/tree/production#getting-started).**

We're using Docker which, luckily for you, means that getting the
application running locally should be fairly painless. First, make sure
that you have [Docker Compose](https://docs.docker.com/compose/install/)
installed on your machine.

If you've not used Docker before, you may need to set up some defaults:

```
docker-machine create --driver virtualbox default
docker-machine start default
eval $(docker-machine env default)
```

Now we're ready to actually get the application running:

```
git clone https://github.com/Vizzuality/gfw-ogr-api.git
cd gfw-mail-api
npm install
npm run develop
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


## Email templates

This microservice uses [Sparkpost](https://www.sparkpost.com/) to send emails, and 
specifically Email Templates as a way to streamline mass email sending. Email Templates
are stored in Sparkpost itself, and referenced by name when sending emails based on said templates.

For ease of maintainability, Sparkpost Email templates are kept in this project, inside the
`email-templates` folder, as part of a [Terraform](https://www.terraform.io/) project. When
modifying said templates, be sure to do so in the files included in this project, and after
running the `terraform apply` (or equivalent) command to apply your changes. If you want, for
ease of testing and development, you can still make temporary changes directly on Sparkpost,
but be sure to port any changes you want to keep back into the code in this project.
