import Dispatch
import SwiftGRPC


class EchoProvider: EchoServiceProvider {
    func echo(request: EchoRequest, session: EchoServiceechoSession) throws -> EchoResponse {
        var response = EchoResponse()
        response.contents = "You sent: \(request.contents)"
        return response
    }
}

let address = "0.0.0.0:9000"
print("Staarting server in \(address)")

let server = ServiceServer(address: address, serviceProviders: [EchoProvider()])

server.start()
dispatchMain()
