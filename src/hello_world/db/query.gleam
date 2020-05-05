import gleam/list
import pg_client/pg_client
import pg_client/pg_client.{PgInt, PgString, Select, Insert}
import hello_world/db/client
import hello_world/blog/post.{Post}

// A list of types means you can't put bad things, like pids in there.
// query string, params
// repo.query("SELECT * FROM users WHERE id=$1", [1.])
pub fn insert_post(title: String, body: String) {
  let sql = "INSERT INTO posts (title, body) VALUES ($1, $2);"
  let args = [PgString(title), PgString(body)]
  let Ok(Insert(1, [])) = pg_client.query(sql, args)
  Ok(Nil)
}

pub fn list_posts() {
  let sql = "SELECT id, title FROM posts;"
  let args = []
  let Ok(Select(1, rows)) = pg_client.query(sql, args)
  list.map(
    rows,
    fn(row) {
      let [PgInt(id), PgString(title)] = row
      Post(id, title)
    },
  )
}
