//
//  PokemonListDataSource.swift
//  swift4-pokedex
//
//  Created by FFUF on 18.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import Rapid
import IGListKit

public final class PokemonListDataSource: JAObject, ListAdapterDataSource {

    private unowned let delegate: PokemonListSectionControllerDelegate

    public init(delegate: PokemonListSectionControllerDelegate, pokemonList: [Pokemon]) {
        self.delegate = delegate
        self.pokemonList = pokemonList
    }

    public private(set) var pokemonList: [Pokemon]

    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.pokemonList
    }

    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return PokemonListSectionController(delegate: self.delegate)
    }

    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
