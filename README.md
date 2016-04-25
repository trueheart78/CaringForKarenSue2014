Caring For Karen Sue 2014
=========================

[![Circle CI](https://circleci.com/gh/trueheart78/CaringForKarenSue2014.svg?style=shield)](https://circleci.com/gh/trueheart78/CaringForKarenSue2014)

A simple ruby site, with sinatra support. Currently running on RedHat's OpenShift platform under ruby 1.9

Run the application with the following:

`bundle exec shotgun`

Running tests:

`bundle exec rake test`

Default Environment File (.env)
-------------------------------

Create a copy of the `.env` file, and then make sure to update it with relevant details:

```sh
cp .env .env.local
vim .env.local
```

Deploying on OpenShift
----------------------

```sh
rhc env set NODE_ENV=production -a $appname
rhc env set APP_SECRET_HASH='$your-secret-hash' -a $appname
```

Visit The Website
----------------------------------

www.CaringForKarenSue.com
