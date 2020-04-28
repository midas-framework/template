// Pull function from config for session config
// everything should depend on config, config should not depend on libraries
pub type Config {
  Config(port: Int, secret_key_base: String)
}

// https://erlang.org/doc/man/os.html#getenv-0
// https://github.com/elixir-lang/elixir/blob/v1.10.3/lib/elixir/lib/system.ex#L438-L444
pub fn from_env() {
  Ok(Config(port: 8080, secret_key_base: "blah"))
}
