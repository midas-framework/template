import gleam/atom
import process/supervisor/rest_for_one
import hello_world/config
import hello_world/web/endpoint
import hello_world/db/client
import midas_utils

fn init() {
  let Ok(config) = config.from_env()

  // Be able to start server with ignore, if PORT not set.
  rest_for_one.Two(
    fn() { client.spawn_link(config) },
    fn(_pool) { endpoint.spawn_link(config) },
  )
}

pub fn start(_start, _args) {
  Ok(rest_for_one.spawn_link(init))
}

pub fn stop(_) {
  atom.create_from_string("ok")
}
