baseimage-rbenv-docker
======================

Docker image with rbenv. Based on phusion's baseimage

[phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)

### How to use
```
FROM macool/baseimage-rbenv-docker

# set $HOME environment variable
ENV HOME /root
# same:
# RUN echo "/root" > /etc/container_environment/HOME

# Use phusion's baseimage-docker's init system.
CMD ["/sbin/my_init"]
```

### Install Ruby (+ gems)
```
RUN rbenv install 2.1.4 && rm -rf /tmp/*
RUN rbenv global 2.1.4
RUN gem install bundler --no-ri --no-rdoc
RUN rbenv rehash
```
