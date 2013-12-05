#!/bin/bash

sudo cp -r ../kwd-events-calendar ../../../../wordpress-test/wp-content/plugins/
sudo chown -R www:www ../../../../wordpress-test/
sudo rm -r ../../../../wordpress-test/wp-content/plugins/kwd-events-calendar/.git
sudo rm -r ../../../../wordpress-test/wp-content/plugins/kwd-events-calendar/.gitignore
sudo rm -r ../../../../wordpress-test/wp-content/plugins/kwd-events-calendar/.DS_Store
