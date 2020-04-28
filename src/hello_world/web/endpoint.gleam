import midas
import hello_world/config.{Config}
import hello_world/web/router

pub fn spawn_link(config) {
  let Config(port: port, ..) = config
  
  midas.spawn_link(router.handle_request(_, config), port)
}
