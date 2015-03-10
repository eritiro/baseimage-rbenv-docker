FROM phusion/baseimage:latest
ENV DEBIAN_FRONTEND noninteractive

# Install basic stuff
RUN apt-get -qq update
RUN apt-get -qqy upgrade
RUN apt-get -qqy install build-essential libssl-dev libreadline-gplv2-dev \
  libxml2-dev libxslt1-dev libpq-dev git-core autoconf bison \
  libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev \
  libgdbm3 libgdbm-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH

# Clean up
RUN apt-get autoremove -y && apt-get clean
RUN rm -rf /tmp/*
