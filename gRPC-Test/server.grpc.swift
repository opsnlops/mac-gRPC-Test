//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: messaging/server.proto
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
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Usage: instantiate `Server_CreatureServerClient`, then call methods of this protocol to make API calls.
public protocol Server_CreatureServerClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Server_CreatureServerClientInterceptorFactoryProtocol? { get }

  func getCreature(
    _ request: Server_CreatureName,
    callOptions: CallOptions?
  ) -> UnaryCall<Server_CreatureName, Server_Creature>

  func getCreatures(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?,
    handler: @escaping (Server_Creature) -> Void
  ) -> ServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Server_Creature>

  func createCreature(
    _ request: Server_Creature,
    callOptions: CallOptions?
  ) -> UnaryCall<Server_Creature, Server_DatabaseInfo>

  func updateCreature(
    _ request: Server_Creature,
    callOptions: CallOptions?
  ) -> UnaryCall<Server_Creature, Server_DatabaseInfo>
}

extension Server_CreatureServerClientProtocol {
  public var serviceName: String {
    return "server.CreatureServer"
  }

  /// Fetches one from the database
  ///
  /// - Parameters:
  ///   - request: Request to send to GetCreature.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getCreature(
    _ request: Server_CreatureName,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Server_CreatureName, Server_Creature> {
    return self.makeUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.getCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCreatureInterceptors() ?? []
    )
  }

  /// Get all of them
  ///
  /// - Parameters:
  ///   - request: Request to send to GetCreatures.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  public func getCreatures(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil,
    handler: @escaping (Server_Creature) -> Void
  ) -> ServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Server_Creature> {
    return self.makeServerStreamingCall(
      path: Server_CreatureServerClientMetadata.Methods.getCreatures.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCreaturesInterceptors() ?? [],
      handler: handler
    )
  }

  /// Create a new creature in the database
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateCreature.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func createCreature(
    _ request: Server_Creature,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Server_Creature, Server_DatabaseInfo> {
    return self.makeUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.createCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateCreatureInterceptors() ?? []
    )
  }

  /// Update an existing creature in the database
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateCreature.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func updateCreature(
    _ request: Server_Creature,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Server_Creature, Server_DatabaseInfo> {
    return self.makeUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.updateCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateCreatureInterceptors() ?? []
    )
  }
}

#if compiler(>=5.6)
@available(*, deprecated)
extension Server_CreatureServerClient: @unchecked Sendable {}
#endif // compiler(>=5.6)

@available(*, deprecated, renamed: "Server_CreatureServerNIOClient")
public final class Server_CreatureServerClient: Server_CreatureServerClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Server_CreatureServerClientInterceptorFactoryProtocol?
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  public var interceptors: Server_CreatureServerClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the server.CreatureServer service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Server_CreatureServerClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

public struct Server_CreatureServerNIOClient: Server_CreatureServerClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Server_CreatureServerClientInterceptorFactoryProtocol?

  /// Creates a client for the server.CreatureServer service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Server_CreatureServerClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#if compiler(>=5.6)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol Server_CreatureServerAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Server_CreatureServerClientInterceptorFactoryProtocol? { get }

  func makeGetCreatureCall(
    _ request: Server_CreatureName,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Server_CreatureName, Server_Creature>

  func makeGetCreaturesCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?
  ) -> GRPCAsyncServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Server_Creature>

  func makeCreateCreatureCall(
    _ request: Server_Creature,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Server_Creature, Server_DatabaseInfo>

  func makeUpdateCreatureCall(
    _ request: Server_Creature,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Server_Creature, Server_DatabaseInfo>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Server_CreatureServerAsyncClientProtocol {
  public static var serviceDescriptor: GRPCServiceDescriptor {
    return Server_CreatureServerClientMetadata.serviceDescriptor
  }

  public var interceptors: Server_CreatureServerClientInterceptorFactoryProtocol? {
    return nil
  }

  public func makeGetCreatureCall(
    _ request: Server_CreatureName,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Server_CreatureName, Server_Creature> {
    return self.makeAsyncUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.getCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCreatureInterceptors() ?? []
    )
  }

  public func makeGetCreaturesCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Server_Creature> {
    return self.makeAsyncServerStreamingCall(
      path: Server_CreatureServerClientMetadata.Methods.getCreatures.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCreaturesInterceptors() ?? []
    )
  }

  public func makeCreateCreatureCall(
    _ request: Server_Creature,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Server_Creature, Server_DatabaseInfo> {
    return self.makeAsyncUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.createCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateCreatureInterceptors() ?? []
    )
  }

  public func makeUpdateCreatureCall(
    _ request: Server_Creature,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Server_Creature, Server_DatabaseInfo> {
    return self.makeAsyncUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.updateCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateCreatureInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Server_CreatureServerAsyncClientProtocol {
  public func getCreature(
    _ request: Server_CreatureName,
    callOptions: CallOptions? = nil
  ) async throws -> Server_Creature {
    return try await self.performAsyncUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.getCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCreatureInterceptors() ?? []
    )
  }

  public func getCreatures(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Server_Creature> {
    return self.performAsyncServerStreamingCall(
      path: Server_CreatureServerClientMetadata.Methods.getCreatures.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCreaturesInterceptors() ?? []
    )
  }

  public func createCreature(
    _ request: Server_Creature,
    callOptions: CallOptions? = nil
  ) async throws -> Server_DatabaseInfo {
    return try await self.performAsyncUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.createCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateCreatureInterceptors() ?? []
    )
  }

  public func updateCreature(
    _ request: Server_Creature,
    callOptions: CallOptions? = nil
  ) async throws -> Server_DatabaseInfo {
    return try await self.performAsyncUnaryCall(
      path: Server_CreatureServerClientMetadata.Methods.updateCreature.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateCreatureInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct Server_CreatureServerAsyncClient: Server_CreatureServerAsyncClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Server_CreatureServerClientInterceptorFactoryProtocol?

  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Server_CreatureServerClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#endif // compiler(>=5.6)

public protocol Server_CreatureServerClientInterceptorFactoryProtocol: GRPCSendable {

  /// - Returns: Interceptors to use when invoking 'getCreature'.
  func makeGetCreatureInterceptors() -> [ClientInterceptor<Server_CreatureName, Server_Creature>]

  /// - Returns: Interceptors to use when invoking 'getCreatures'.
  func makeGetCreaturesInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_Empty, Server_Creature>]

  /// - Returns: Interceptors to use when invoking 'createCreature'.
  func makeCreateCreatureInterceptors() -> [ClientInterceptor<Server_Creature, Server_DatabaseInfo>]

  /// - Returns: Interceptors to use when invoking 'updateCreature'.
  func makeUpdateCreatureInterceptors() -> [ClientInterceptor<Server_Creature, Server_DatabaseInfo>]
}

public enum Server_CreatureServerClientMetadata {
  public static let serviceDescriptor = GRPCServiceDescriptor(
    name: "CreatureServer",
    fullName: "server.CreatureServer",
    methods: [
      Server_CreatureServerClientMetadata.Methods.getCreature,
      Server_CreatureServerClientMetadata.Methods.getCreatures,
      Server_CreatureServerClientMetadata.Methods.createCreature,
      Server_CreatureServerClientMetadata.Methods.updateCreature,
    ]
  )

  public enum Methods {
    public static let getCreature = GRPCMethodDescriptor(
      name: "GetCreature",
      path: "/server.CreatureServer/GetCreature",
      type: GRPCCallType.unary
    )

    public static let getCreatures = GRPCMethodDescriptor(
      name: "GetCreatures",
      path: "/server.CreatureServer/GetCreatures",
      type: GRPCCallType.serverStreaming
    )

    public static let createCreature = GRPCMethodDescriptor(
      name: "CreateCreature",
      path: "/server.CreatureServer/CreateCreature",
      type: GRPCCallType.unary
    )

    public static let updateCreature = GRPCMethodDescriptor(
      name: "UpdateCreature",
      path: "/server.CreatureServer/UpdateCreature",
      type: GRPCCallType.unary
    )
  }
}

