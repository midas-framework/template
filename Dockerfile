FROM gleamlang/midas

COPY . .

RUN rebar3 upgrade && rebar3 release
CMD ["_build/default/rel/hello_world/bin/hello_world","foreground"]
