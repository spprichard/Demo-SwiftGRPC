
let client = EchoServiceServiceClient(address: "0.0.0.0:9000", secure: false)

var request = EchoRequest()

request.contents = "Hello, world!"
let response = try client.echo(request)
print("Response from server: \(response.contents)")
