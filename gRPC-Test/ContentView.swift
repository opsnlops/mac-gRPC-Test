//
//  ContentView.swift
//  gRPC-Test
//
//  Created by April White on 4/3/23.
//

import SwiftUI
import Combine
import Foundation


class GRPCViewModel: ObservableObject {
    @Published var responseText: String = ""
    private var cancellables = Set<AnyCancellable>()
    private let grpcManager: GRPCManager

    init(grpcManager: GRPCManager) {
        self.grpcManager = grpcManager
    }
    
    func getCreature(creatureName: String) async -> Server_Creature {
        do {
            let client = try await grpcManager.getClient()
            var request = Server_CreatureName()
            request.name = "Beaky"
            let response = try await client.service.getCreature(request)
            responseText = "Received response: \(response)"
            return response;
        } catch {
            responseText = "Error: \(error)"
        }
        
        return Server_Creature()
    }
}

struct ContentView: View {
    @EnvironmentObject private var grpcManager: GRPCManager
        @StateObject private var viewModel: GRPCViewModel

        init() {
            _viewModel = StateObject(wrappedValue: GRPCViewModel(grpcManager: grpcManager))
        }
        
    var body: some View {
        
        
        VStack {
            Button("Do it!") {
                Task(priority: .background) {
                    do {
                       
                        let creature = try await viewModel.getCreature(creatureName: "Beaky")
                        print("Did it!")
                    }
                    catch {
                        print("ERROR")
                    }
                }
            }
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
