//
//  PokemonListSectionController.swift
//  swift4-pokedex
//
//  Created by FFUF on 17.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import IGListKit

public final class PokemonListSectionController: ListSectionController {

    private unowned let delegate: PokemonListSectionControllerDelegate

    public init(delegate: PokemonListSectionControllerDelegate) {
        self.delegate = delegate
        super.init()
    }

    private var pokemon: Pokemon!

    override public func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 100.0)
    }

    override public func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(
            of: PokemonListCell.self,
            for: self,
            at: index
        ) as! PokemonListCell //swiftlint:disable:this force_cast

        let pokemonViewModel = PokemonListViewModel(pokemon: pokemon)
        cell.configure(with: pokemonViewModel)

        return cell
    }

    override public func didUpdate(to object: Any) {
        self.pokemon = object as? Pokemon
    }

    override public func didSelectItem(at index: Int) {
        self.delegate.selected(pokemon: pokemon)
    }
}
