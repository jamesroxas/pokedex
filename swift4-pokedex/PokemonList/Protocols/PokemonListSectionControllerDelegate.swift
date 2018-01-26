//
//  PokemonListSectionControllerDelegate.swift
//  swift4-pokedex
//
//  Created by FFUF on 18.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit

public protocol PokemonListSectionControllerDelegate: class {
    
    func selected(pokemon: Pokemon)
}
