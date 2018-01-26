//
//  PokemonEvolutionNodes.swift
//  swift4-pokedex
//
//  Created by FFUF on 25/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation

public struct PokemonEvolutionNode {
    
    // MARK: Stored Properties
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
