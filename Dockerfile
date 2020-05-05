FROM gleamlang/midas

RUN apt-get update && apt-get install -y inotify-tools

COPY . .

# Done so generated files are available to heroku run bash
RUN rebar3 upgrade && rebar3 release
CMD ["_build/default/rel/hello_world/bin/hello_world","foreground"]
