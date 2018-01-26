//
//  PokemonEvolutionChainRequest.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import FSwiftNetworking

struct PokemonEvolutionChainRequest: Request {
    
    let id: Int
    
    var configuration: RequestConfiguration {
        return PokeAPIConfiguration()
    }
    
    var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    var pathComponents: [String] {
        return [
            "evolution-chain",
            "\(self.id)"
        ]
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    var headers: [String : Any] {
        return [:]
    }
}

