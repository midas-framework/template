import process/supervisor/rest_for_one
import midas_utils
// TODO rename to service and use midas top level
import midas/supervisor
import hello_world/config
import hello_world/web

// import hello_world/web/endpoint better name because of db/service possibility
// call endpoint in midas
// import hello_world/web/service
fn init() {
  // TODO config
  let Ok(config) = config.from_env()

  rest_for_one.One(// fn() { service.spawn_link(config) }
    // fn() { midas.spawn_link(router.handle_request(_, config), 8080) }
    fn() { supervisor.spawn_link(web.handle_request, 8080) })
}

pub fn start(_start, _args) {
  let pid = rest_for_one.spawn_link(init)
  Ok(pid)
}
