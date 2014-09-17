FROM phusion/baseimage:latest
env DEBIAN_FRONTEND noninteractive

# Install basic things
RUN apt-get -qq update
RUN apt-get -qqy install build-essential libssl-dev libreadline-gplv2-dev \
  libxml2-dev libxslt1-dev libpq-dev git-core

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH

# Clean up
RUN apt-get autoremove -y && apt-get clean
RUN rm -rf /tmp/*
