import process/supervisor/rest_for_one
import hello_world/config
import hello_world/web/endpoint
import hello_world/db/pool
import midas_utils

fn init() {
  let Ok(config) = config.from_env()

  // rest_for_one.One(fn() { endpoint.spawn_link(config) })
  rest_for_one.Two(
    fn() { pool.spawn_link(config) },
    fn(_pool) { endpoint.spawn_link(config) },
  )
}

pub fn start(_start, _args) {
  Ok(rest_for_one.spawn_link(init))
}
