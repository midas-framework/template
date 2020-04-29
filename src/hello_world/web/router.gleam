import gleam/iodata
import midas/request.{Request}
import midas/response.{Response}

pub fn handle_request(request: Request, config) -> Response {
  let Request(path: path, ..) = request
  case path {
    "/" -> Response(status: 200, headers: [], body: "Hello, World!")
    _ -> Response(status: 404, headers: [], body: "Nothing here.")
  }
}
