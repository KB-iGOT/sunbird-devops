FROM circleci/android:api-28-node8-alpha

MAINTAINER Rajesh Rajendran <rjshrjndrn@gmail.com>

WORKDIR /home/circleci

# Install global packages
RUN sudo npm install -g ionic cordova node-sass --unsafe-perm

# Explicitly run as non-root user
USER circleci