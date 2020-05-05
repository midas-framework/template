#!/bin/sh
# alternative
# https://github.com/watchexec/watchexec/releases
_build/default/rel/hello_world/bin/hello_world start

inotifywait -r -m -e modify -e create -e delete src |
   while read path _ file; do
       rebar3 release
       _build/default/rel/hello_world/bin/hello_world restart
   done
