FROM phusion/baseimage:latest
ENV DEBIAN_FRONTEND noninteractive

# Install basic stuff
RUN apt-get -qq update
RUN apt-get -qqy upgrade
RUN apt-get -qqy install autoconf bison build-essential git-core libffi-dev \
  libgdbm-dev libgdbm3 libncurses5-dev libpq-dev libreadline6-dev \
  libssl-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH

# Clean up
RUN apt-get autoremove -y && apt-get clean
RUN rm -rf /tmp/*
