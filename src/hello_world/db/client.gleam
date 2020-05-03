import gleam/atom
import gleam/atom.{Atom}
import gleam/dynamic
import gleam/dynamic.{Dynamic}
import gleam/map.{Map}

import midas/http
import midas_utils

import pg_client/pg_client
import hello_world/config.{Config}

external fn uri_parse(String) -> Map(Atom, Dynamic) = "uri_string" "parse"

pub fn spawn_link(config){
    let Config(
      database_url: database_url,
      ..,
    ) = config

    // TODO move this to the midas framework
    let database_url = uri_parse(database_url)
    let Ok(postgres_host) = map.get(database_url, atom.create_from_string("host"))
    let Ok(postgres_host) = dynamic.string(postgres_host)
    let Ok(path) = map.get(database_url, atom.create_from_string("path"))
    let Ok(path) = dynamic.string(path)
    let Ok(userinfo) = map.get(database_url, atom.create_from_string("userinfo"))
    let Ok(userinfo) = dynamic.string(userinfo)
    let tuple(postgres_user, Ok(postgres_password)) = midas_utils.split_on(userinfo, ":")
    let [postgres_db] = http.split_segments(path)

    let options = [
        pg_client.Host(postgres_host),
        pg_client.Database(postgres_db),
        pg_client.User(postgres_user),
        pg_client.Password(postgres_password),
      ]
     let Ok(pid) = pg_client.start_link(options)
     pid
}
