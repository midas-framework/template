import process/process.{Pid}
import hello_world/config.{Config}

// #{host => "127.0.0.1", database => "postgres", user => "postgres", password => "postgres"}
pub type PgoOptions {
  Host(String)
  Database(String)
  User(String)
  Password(String)
}

external fn do_spawn_link(List(PgoOptions)) -> Pid(a) =
  "pool_native" "spawn_link"

pub fn spawn_link(config) {
  let Config(
    postgres_host: postgres_host,
    postgres_db: postgres_db,
    postgres_user: postgres_user,
    postgres_password: postgres_password,
    ..,
  ) = config
  let options = [
      Host(postgres_host),
      Database(postgres_db),
      User(postgres_user),
      Password(postgres_password),
    ]
  do_spawn_link(options)
}
