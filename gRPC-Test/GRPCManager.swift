//
//  GRPCManager.swift
//  gRPC-Test
//
//  Created by April White on 4/3/23.
//

import Foundation
import GRPC
import NIO
import SwiftUI
import Combine

class GRPCManager: ObservableObject {
    private let group: MultiThreadedEventLoopGroup
    private let channel: ClientConnection

    init() {
        group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        let target = ConnectionTarget.hostAndPort("10.3.2.11", 6666)
        //let tlsConfiguration = TLSConfiguration.makeClientConfiguration() // Customize TLS configuration if necessary

        let configuration = ClientConnection.Configuration(
            target: target,
            //transportSecurity: tlsConfiguration,
            eventLoopGroup: group,
            connectionBackoff: nil,
            connectionKeepalive: ClientConnectionKeepalive(),
            connectionIdleTimeout: .minutes(5),
            callStartBehavior: .waitsForConnectivity
        )

        channel = ClientConnection(configuration: configuration)
    }

    deinit {
        try? channel.close().wait()
        try? group.syncShutdownGracefully()
    }

    func getClient() -> OurClient {
        return OurClient(channel: channel)
    }
}
