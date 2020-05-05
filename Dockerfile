FROM gleamlang/midas

COPY . .

CMD ["bash", "-c", "rebar3 upgrade && rebar3 release && _build/default/rel/hello_world/bin/hello_world foreground"]
