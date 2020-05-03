FROM gleamlang/gleam:latest

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY . .

CMD ["bash", "-c", "rebar3 upgrade && rebar3 release && _build/default/rel/hello_world/bin/hello_world foreground"]
