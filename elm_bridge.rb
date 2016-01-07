require "sinatra"

require "json"

get("/") {
  erb :index
}

get("/data") {
  content_type :json
  data = [
    {name: "James Edward Gray II", expertise: "Kindergarten", age: 39},
    {name: "Paul Dawson", expertise: "Linux Kernels"}
  ]

  data.to_json
}
