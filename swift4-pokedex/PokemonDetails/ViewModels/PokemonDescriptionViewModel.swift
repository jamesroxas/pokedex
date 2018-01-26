//
//  PokemonDetailsViewModel.swift
//  swift4-pokedex
//
//  Created by FFUF on 26/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import UIKit

public struct PokemonDescriptionViewModel {

    public init(model: PokemonModels) {
        self.pokemonDetails = model.pokemonDetails
        self.pokemonSpecies = model.pokemonSpecies
        self.pokemonEvolution = model.pokemonEvolution
    }

    // MARK: Stored Properties
    public let pokemonDetails: PokemonDetails
    public let pokemonSpecies: PokemonSpecies
    public let pokemonEvolution: PokemonEvolution

    var id: String {
        return String(format: "%03d", self.pokemonDetails.id)
    }

    var imageName: String {
        return String(self.pokemonDetails.id)
    }

    var description: String {
        var text = String()
        self.pokemonSpecies.flavor.forEach { (flavor) in
            if flavor.language.name == "en" && flavor.version.name == "alpha-sapphire" {
                text = flavor.text
            }
        }
        return text
    }

    var name: String {
        return self.pokemonDetails.name.uppercasedFirstLetter
    }

    var height: String {
        return "\(self.convertPokemon(heightWeight: self.pokemonDetails.height)) m"
    }

    var weight: String {
        return "\(self.convertPokemon(heightWeight: self.pokemonDetails.weight)) kg"
    }

    var type: String {
        var pokemonTypes = [String]()
        self.pokemonDetails.types.reversed().forEach { (types) in
            pokemonTypes.append(types.type.name.uppercasedFirstLetter)
        }
        return "\(pokemonTypes.joined(separator: "/"))"
    }

    var colorType: UIColor {
        return (PokemonType(rawValue: self.pokemonDetails.types.last!.type.name)?.color)!
    }

    var pokemonEvolutionNodes: [PokemonEvolutionNode] {
        return self.pokemonEvolution.pokemonEvolutionNodes
    }

}

extension PokemonDescriptionViewModel {
    private func convertPokemon(heightWeight: Int) -> Float {
        let pokemonheightWeightFloat = Float(heightWeight)
        return pokemonheightWeightFloat / 10
    }
}
