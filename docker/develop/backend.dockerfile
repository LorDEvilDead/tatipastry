FROM ruby:3.1.2-buster

ENV APP_ROOT=/backend \
    BUNDLER_VERSION=2.5.7

RUN set -eux; \
    apt-get update; \
    apt-get -y upgrade; \
    apt-get install -y libpq-dev

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
RUN gem install bundler:${BUNDLER_VERSION}

COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . .

EXPOSE 3000
CMD [ "bundle", "exec", "puma", "config.ru" ]
