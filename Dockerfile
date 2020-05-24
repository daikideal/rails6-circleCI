FROM ruby:2.7.1-alpine

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apk update && apk add --no-cache \
    gcc \
    g++ \
    libc-dev \
    libxml2-dev \
    linux-headers \
    make \
    mysql-client \
    mysql-dev \
    nodejs \
    tzdata \
    vim \
    yarn \
    && apk add --virtual build-package --no-cache \
    build-base \
    curl-dev

WORKDIR /rails6-circleCI

COPY Gemfile /rails6-circleCI
COPY Gemfile.lock /rails6-circleCI/Gemfile.lock

RUN bundle install
RUN apk del build-package
COPY . /rails6-circleCI

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]