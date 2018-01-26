//
//  PokemonListViewModel.swift
//  swift4-pokedex
//
//  Created by FFUF on 26/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import UIKit

public struct PokemonListViewModel {
    
    let pokemon: Pokemon
    
    public init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var name: String {
        return self.pokemon.name
    }
    
    var height: String {
        return "\(self.convertPokemon(heightWeight: self.pokemon.height)) m"
    }
    
    var weight: String {
        return "\(self.convertPokemon(heightWeight: self.pokemon.weight)) kg"
    }
    
    var image: UIImage {
        return UIImage(named: "\(self.pokemon.id)")!
    }
}

extension PokemonListViewModel {
    private func convertPokemon(heightWeight: String) -> Float {
        let pokemonheightWeightFloat = Float(heightWeight)!
        return pokemonheightWeightFloat / 10
    }
}
