import gleam/int
import gleam/list
import gleam/result
import gleam/string
import midas/http
import midas/http.{Request, Response, Get, Post}

external fn body_length(String) -> Int =
  "erlang" "iolist_size"

pub fn handle_request(request, _config) {
  let Request(
    method: method,
    path: path,
    query: query,
    body: body,
    ..,
  ) = request
  let segments = http.split_segments(path)
  let Ok(params) = http.parse_query(result.unwrap(query, ""))

  case method, segments {
    Get, [] -> {
      let name = params
        |> list.key_find(_, "name")
        |> result.unwrap(_, "World")

      Response(
        status: 200,
        headers: [tuple("content-type", "text/plain")],
        body: string.concat(["Hello, ", name, "!\r\n"]),
      )
    }

    Get, ["posts", id] -> // Action to get a post by id
      todo
      
    Post, ["posts"] -> // Action to create a post
      todo
      
    _, _ -> Response(
      status: 404,
      headers: [
        tuple("content-type", "text/plain"),
        tuple("content-length", "11"),
      ],
      body: "Nothing here.\r\n",
    )
  }
}
