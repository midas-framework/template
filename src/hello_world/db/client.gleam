import pg_client/pg_client
import hello_world/config.{Config}

pub fn spawn_link(config){
    let Config(
      postgres_host: postgres_host,
      postgres_db: postgres_db,
      postgres_user: postgres_user,
      postgres_password: postgres_password,
      ..,
    ) = config
    let options = [
        pg_client.Host(postgres_host),
        pg_client.Database(postgres_db),
        pg_client.User(postgres_user),
        pg_client.Password(postgres_password),
      ]
     let Ok(pid) = pg_client.start_link(options)
     pid
}
