baseimage-rbenv-docker
======================

Docker image with rbenv. Based on phusion's baseimage

[phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)

### How to use
##### Basic usage
```
FROM macool/baseimage-rbenv-docker

# set $HOME environment variable
ENV HOME /root
# same:
# RUN echo "/root" > /etc/container_environment/HOME

# Use phusion's baseimage-docker's init system.
CMD ["/sbin/my_init"]
```

##### Update rbenv and ruby build definitions
New ruby definitions may not be inside the base image's. In case we need a new one:
```
RUN bash -c 'cd /root/.rbenv && git pull'
RUN bash -c 'cd /root/.rbenv/plugins/ruby-build && git pull'
```

##### Install Ruby (+ gems)
```
RUN rbenv install 2.2.1 && rm -rf /tmp/*
RUN rbenv global 2.2.1
RUN gem install bundler --no-ri --no-rdoc
RUN rbenv rehash
```

##### Examples
- [trade-tariff-backend/Dockerfile](https://github.com/bitzesty/trade-tariff-backend/blob/tariff-docker/Dockerfile)
- [trade-tariff-frontend/Dockerfile](https://github.com/bitzesty/trade-tariff-frontend/blob/tariff-docker/Dockerfile)
- [trade-tariff-admin/Dockerfile](https://github.com/bitzesty/trade-tariff-admin/blob/tariff-docker/Dockerfile)
