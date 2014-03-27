Caring For Karen Sue 2014
=========================

A simple ruby site, with sinatra support. Currently running on RedHat's OpenShift platform under ruby 1.9

Deploying on OpenShift
----------------------
rhc env set NODE_ENV=production -a $appname
rhc env set APP_SECRET_HASH='$your-secret-hash' -a $appname

Visit The Website
----------------------------------

www.CaringForKarenSue.com