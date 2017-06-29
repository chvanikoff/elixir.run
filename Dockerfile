FROM bitwalker/alpine-elixir-phoenix:1.4.2

ENV MIX_ENV=prod \
    REPLACE_OS_VARS=true

RUN mkdir build
WORKDIR build

COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD assets/package.json assets/package.json
RUN cd assets \
  && npm install \
  && npm install -g react-stdio

COPY . ./

RUN cd assets \
  && node_modules/.bin/webpack -p \
  && cd ../ \
  && mix do compile, phx.digest

ARG VERSION
ARG APP
ENV APP=$APP

RUN mix release --env=prod \
  && cp _build/prod/rel/${APP}/releases/${VERSION}/${APP}.tar.gz ../

WORKDIR ../

RUN tar -xf ${APP}.tar.gz \
  && rm -rf build ${APP}.tar.gz \
  && mv bin/${APP} bin/app

COPY ./rel/boot.sh ./app

RUN chmod +x ./app

USER default

ENTRYPOINT ["/opt/app/app"]
CMD ["foreground"]
