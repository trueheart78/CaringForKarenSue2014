# Caring For Karen Sue 2014

[![Circle CI](https://circleci.com/gh/trueheart78/CaringForKarenSue2014.svg?style=shield)](https://circleci.com/gh/trueheart78/CaringForKarenSue2014)

A simple ruby site, with sinatra support. Currently running on RedHat's OpenShift platform under ruby 1.9

Run the application with the following:

`bundle exec shotgun`

Running tests:

`bundle exec rake test`

## Default Environment File (.env)

Create a copy of the `.env` file, and then make sure to update it with relevant details:

```sh
cp .env .env.local
vim .env.local
```

Load order for `.env` files are as follows:

1. `.env.NODE_ENV`, where `NODE_ENV` is `test`,`development`, or `production`
2. `.env.local`
3. `.env`

You can setup a `.env.local` for data that is general, and put specifics in the
`NODE_ENV` versions.

## Deploying on OpenShift

```sh
rhc env set NODE_ENV=production -a appname -n namespace
rhc env set APP_SECRET_HASH='your-secret-hash' -a appname -n namespace
rhc env list -a appname -n namespace
```

## Visit The Website

[www.CaringForKarenSue.com](http://www.caringforkarensue.com)
