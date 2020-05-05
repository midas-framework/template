import gleam/atom
import gleam/atom.{Atom}
import gleam/dynamic
import gleam/dynamic.{Dynamic}
import gleam/map.{Map}
import midas/http
import midas_utils
import pg_client/pg_client
import hello_world/config.{Config}

external fn uri_parse(String) -> Map(Atom, Dynamic) =
  "uri_string" "parse"

pub fn spawn_link(config) {
  let Config(database_url: database_url, ..) = config

  let Ok(pid) = pg_client.start_link(database_url)
  pid
}
