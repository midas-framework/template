import gleam/int
import config/config.{get_env, required, optional}

// Pull function from config for session config
// everything should depend on config, config should not depend on libraries
pub type Config {
  Config(port: Int, secret_key_base: String)
}

pub fn from_env() {
  let env = get_env()

  // let Ok(secret_key_base) = required(env, "SECRET_KEY_BASE", fn(x) { Ok(x) })
  let port = optional(env, "PORT", int.parse, 8080)

  Ok(Config(port: port, secret_key_base: "secret_key_base"))
}
