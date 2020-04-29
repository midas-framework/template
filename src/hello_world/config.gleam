import gleam/int
import config/config.{get_env, required, optional}

// Pull function from config for session config
// everything should depend on config, config should not depend on libraries
pub type Config {
  Config(
    port: Int,
    secret_key_base: String,
    postgres_host: String,
    postgres_db: String,
    postgres_user: String,
    postgres_password: String,
  )
}

fn string(s) {
  Ok(s)
}

pub fn from_env() {
  let env = get_env()

  // let Ok(secret_key_base) = required(env, "SECRET_KEY_BASE", fn(x) { Ok(x) })
  let port = optional(env, "PORT", int.parse, 8080)
  let Ok(postgres_host) = required(env, "POSTGRES_HOST", string)
  let Ok(postgres_db) = required(env, "POSTGRES_DB", string)
  let Ok(postgres_user) = required(env, "POSTGRES_USER", string)
  let Ok(postgres_password) = required(env, "POSTGRES_PASSWORD", string)

  Ok(
    Config(
      port: port,
      secret_key_base: "secret_key_base",
      postgres_host: postgres_host,
      postgres_db: postgres_db,
      postgres_user: postgres_user,
      postgres_password: postgres_password,
    ),
  )
}
