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

    public var health: String {
        return self.pokemonDetails.stats[5].stat.name.capitalized
    }

    public var attack: String {
        return self.pokemonDetails.stats[4].stat.name.capitalized
    }

    public var defense: String {
        return self.pokemonDetails.stats[3].stat.name.capitalized
    }

    public var specialAttack: String {
        return self.pokemonDetails.stats[2].stat.name.capitalized
    }

    public var specialDefense: String {
        return self.pokemonDetails.stats[1].stat.name.capitalized
    }

    public var speed: String {
        return self.pokemonDetails.stats[0].stat.name.capitalized
    }

    var stats: [Stats] {
        return pokemonDetails.stats.reversed()
    }
}
