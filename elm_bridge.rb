require "sinatra"

require "json"

get("/") {
  data = [
    {name: "James Edward Gray II", expertise: "Kindergarten", age: 39},
    {name: "Paul Dawson", expertise: "Linux Kernels"}
  ]
  erb :index, locals: {data: data}
}
