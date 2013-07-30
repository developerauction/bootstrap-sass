#!/bin/bash 
ROOT=`pwd`"/vendor/assets"
TMP='tmp/sass-twitter-bootstrap'
# Pull down sass-twitter-bootstrap sources
git clone https://github.com/anjlab/bootstrap-rails tmp/sass-twitter-bootstrap

# Copy lib/ to stylesheets/
mkdir -p $ROOT/stylesheets/bootstrap
cp -r $TMP/app/assets/stylesheets/twitter/* $ROOT/stylesheets
# Copy js/ to javascripts/bootstrap
cp -r $TMP/app/assets/javascripts/twitter/* $ROOT/javascripts
# Copy fonts/ to fonts/
#cp -r $TMP/fonts/* $ROOT/fonts
# Remove tests
rm -r $ROOT/javascripts/bootstrap/tests

# Patch paths in bootstrap.scss and responsive.scss

# Depending on your version of sed, the command may need to look like this instead: 
 sed -i.bak 's_@import \"_@import \"bootstrap/_g' $ROOT/stylesheets/bootstrap/bootstrap.scss
# You'll probably need to do this if you're on linux instead of OSX.

#sed -i .bak 's_@import \"_@import \"bootstrap/_g' $ROOT/stylesheets/bootstrap/bootstrap.scss
rm $ROOT/stylesheets/bootstrap/*.bak

#rm -rf $TMP
