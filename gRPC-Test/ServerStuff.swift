//
//  ServerStuff.swift
//  gRPC-Test
//
//  Created by April White on 4/3/23.
//

import Foundation
import GRPC
import NIOCore
import NIOPosix

struct CreatureServer {
    var hostName = "10.3.2.11"
    var port = 6666
    
    let server: Server_CreatureServerAsyncClient
    
   
    
    func getCreature(nameToSearchFor: String) async throws -> Server_Creature {
        
        let name = Server_CreatureName()
        var creature: Server_Creature
        
        do {
              creature = try await self.server.getCreature(name)

              if !creature.name.isEmpty {
                  print("Found creature called '\(nameToSearchFor)'")
              } else {
                  print("Found no creature called \(nameToSearchFor)")
              }
            
            } catch {
              print("RPC failed: \(error)")
                creature = Server_Creature()
            }
        
        return creature
    }
}
