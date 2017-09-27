# Caring For Karen Sue 2014

[![Circle CI](https://circleci.com/gh/trueheart78/CaringForKarenSue2014.svg?style=shield)](https://circleci.com/gh/trueheart78/CaringForKarenSue2014)

A simple ruby site, with sinatra support. Currently running on Heroku under Ruby 2.4.

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

1. `.env.RACK_ENV`, where `RACK_ENV` is `test`,`development`, or `production`
2. `.env.local`
3. `.env`

You can setup a `.env.local` for data that is general, and put specifics in the
`RACK_ENV` versions.

## Visit The Website

[www.CaringForKarenSue.com](http://www.caringforkarensue.com)
