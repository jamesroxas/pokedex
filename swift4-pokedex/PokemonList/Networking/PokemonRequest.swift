//
//  PokemonRequest.swift
//  swift4-pokedex
//
//  Created by FFUF on 19.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import FSwiftNetworking

struct PokemonRequest: Request {
    
    let id: Int
    
    var configuration: RequestConfiguration {
        return PokeAPIConfiguration()
    }
    
    var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    var pathComponents: [String] {
        return [
            "pokemon",
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
