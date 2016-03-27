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
`NODE_ENV=[production,development]`

`APP_SECRET_HASH='[randomly-generated-hash]'`

`ADMIN_NAME='Ed Example'`

`ADMIN_EMAIL='ed@example.com'`

`MANDRILL_API_KEY='[mandrill-api-key]'`

Deploying on OpenShift
----------------------
`rhc env set NODE_ENV=production -a $appname`

`rhc env set APP_SECRET_HASH='$your-secret-hash' -a $appname`

Visit The Website
----------------------------------

www.CaringForKarenSue.com

