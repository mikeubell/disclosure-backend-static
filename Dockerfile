# This Dockerfile is meant to create an environment similar to the one on
# Travis-CI.
#
# The script on the last line (the RUN line) should be run the same way in both
# environments and ideally it should fail on in the same ways.
FROM ubuntu:trusty
RUN locale-gen "en_US.UTF-8" && dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TRAVIS_BUILD_DIR /src

ADD . /src
RUN /src/bin/travis-create-docker-environment
RUN bash -c 'cd /src && pip install -r requirements.txt'
RUN bash -c 'cd /src && bundle install'
