//
//  gRPC_TestApp.swift
//  gRPC-Test
//
//  Created by April White on 4/3/23.
//

import SwiftUI
import GRPC
import NIOCore
import NIOPosix



@main
struct gRPC_TestApp: App {
    
    @StateObject private var grpcManager = GRPCManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(grpcManager)
        }
    }
}
