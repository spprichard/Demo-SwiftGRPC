//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Sources/Protos/echo.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import Dispatch
import SwiftGRPC
import SwiftProtobuf

internal protocol EchoServiceechoCall: ClientCallUnary {}

fileprivate final class EchoServiceechoCallBase: ClientCallUnaryBase<EchoRequest, EchoResponse>, EchoServiceechoCall {
  override class var method: String { return "/EchoService/echo" }
}


/// Instantiate EchoServiceServiceClient, then call methods of this protocol to make API calls.
internal protocol EchoServiceService: ServiceClient {
  /// Synchronous. Unary.
  func echo(_ request: EchoRequest) throws -> EchoResponse
  /// Asynchronous. Unary.
  func echo(_ request: EchoRequest, completion: @escaping (EchoResponse?, CallResult) -> Void) throws -> EchoServiceechoCall

}

internal final class EchoServiceServiceClient: ServiceClientBase, EchoServiceService {
  /// Synchronous. Unary.
  internal func echo(_ request: EchoRequest) throws -> EchoResponse {
    return try EchoServiceechoCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func echo(_ request: EchoRequest, completion: @escaping (EchoResponse?, CallResult) -> Void) throws -> EchoServiceechoCall {
    return try EchoServiceechoCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol EchoServiceProvider: ServiceProvider {
  func echo(request: EchoRequest, session: EchoServiceechoSession) throws -> EchoResponse
}

extension EchoServiceProvider {
  internal var serviceName: String { return "EchoService" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/EchoService/echo":
      return try EchoServiceechoSessionBase(
        handler: handler,
        providerBlock: { try self.echo(request: $0, session: $1 as! EchoServiceechoSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

internal protocol EchoServiceechoSession: ServerSessionUnary {}

fileprivate final class EchoServiceechoSessionBase: ServerSessionUnaryBase<EchoRequest, EchoResponse>, EchoServiceechoSession {}

