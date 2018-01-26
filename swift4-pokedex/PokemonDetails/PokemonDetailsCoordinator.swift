//
//  PokemonDetailsCoordinator.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import Result
import FSwiftNetworking

public class PokemonDetailsCoordinator: AbstractCoordinator {

    // MARK: Delegate Properties
    private unowned let delegate: PokemonDetailsCoordinatorDelegate

    // MARK: Initializer
    init(delegate: PokemonDetailsCoordinatorDelegate, navigationController: UINavigationController, pokemonModels: PokemonModels) {
        self.delegate = delegate
        self.navigationController = navigationController
        self.models = pokemonModels
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let models: PokemonModels

    // MARK: Instance Methods
    public override func start() {
        super.start()
        let vc: PokemonDetailsVC = PokemonDetailsVC(
            delegate: self,
            pokemonModels: self.models,
            navigationController: self.navigationController
        )

        self.navigationController.navigationBar.barTintColor = PokemonType(
            rawValue: self.models.pokemonDetails.types.last!.type.name)?
            .color
        self.navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: DetailVCDelegate Functions
extension PokemonDetailsCoordinator: PokemonDetailsVCDelegate {
    public func backButtonPressed() {

        _ = self.navigationController.popViewController(animated: true)
        self.delegate.dismiss(coordinator: self)
    }

}
