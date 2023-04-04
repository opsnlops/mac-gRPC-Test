//
//  GRPCClient.swift
//  gRPC-Test
//
//  Created by April White on 4/3/23.
//

import Foundation
import GRPC
import NIO

class OurClient {
    private let channel: ClientConnection
    let service: Server_CreatureServerAsyncClient

    init(channel: ClientConnection) {
        self.channel = channel
        service = Server_CreatureServerAsyncClient(channel: channel)
    }

    deinit {
        // Clean up when the instance is deallocated
        try? channel.close().wait()
    }
}
