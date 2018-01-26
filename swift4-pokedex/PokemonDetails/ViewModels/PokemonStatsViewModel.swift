//
//  PokemonStatsViewModel.swift
//  swift4-pokedex
//
//  Created by FFUF on 26/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation

public struct PokemonStatsViewModel {
    
    public init(model: PokemonModels) {
        self.pokemonDetails = model.pokemonDetails
        self.pokemonSpecies = model.pokemonSpecies
        self.pokemonEvolution = model.pokemonEvolution
    }
    
    // MARK: Stored Properties
    public let pokemonDetails: PokemonDetails
    public let pokemonSpecies: PokemonSpecies
    public let pokemonEvolution: PokemonEvolution
    
    var health: String {
        return self.pokemonDetails.stats[5].stat.name
    }
    
    var attack: String {
        return self.pokemonDetails.stats[4].stat.name
    }
    
    var defense: String {
        return self.pokemonDetails.stats[3].stat.name
    }
    
    var specialAttack: String {
        return self.pokemonDetails.stats[2].stat.name
    }
    
    var specialDefense: String {
        return self.pokemonDetails.stats[1].stat.name
    }
    
    var speed: String {
        return self.pokemonDetails.stats[0].stat.name
    }
    
    var stats: [Stats] {
        return pokemonDetails.stats.reversed()
    }
}
