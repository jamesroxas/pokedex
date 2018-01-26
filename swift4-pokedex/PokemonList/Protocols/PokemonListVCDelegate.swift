//
//  PokemonListVCDelegate.swift
//  swift4-pokedex
//
//  Created by FFUF on 19.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation

public protocol PokemonListVCDelegate: class {
    func pokemonTapped(pokemon: Pokemon)
}
