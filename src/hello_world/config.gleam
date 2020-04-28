// Pull function from config for session config
// everything should depend on config, config should not depend on libraries
type Config {
  Config(port: Int)
}

// https://erlang.org/doc/man/os.html#getenv-0
// https://github.com/elixir-lang/elixir/blob/v1.10.3/lib/elixir/lib/system.ex#L438-L444

pub fn from_env() {
  Ok(Nil)
}
