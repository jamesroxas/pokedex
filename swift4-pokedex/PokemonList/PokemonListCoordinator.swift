//
//  Coordinator.swift
//  swift4-pokedex
//
//  Created by FFUF on 19.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import Result
import FSwiftNetworking

public class PokemonListCoordinator: AbstractCoordinator {

    // MARK: Delagate Properties
    private let pokemonListService: PokemonListService = PokemonListService()

    // MARK: Initializer
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController

    // MARK: Computed Properties

    // MARK: Instance Methods
    public override func start() {
        let vc: PokemonListVC = PokemonListVC(delegate: self, navigationController: self.navigationController)
        self.navigationController.pushViewController(vc, animated: true)
    }

}

extension PokemonListCoordinator: PokemonListVCDelegate {
    public func pokemonTapped(pokemon: Pokemon) {
        self.pokemonListService.getPokemonDetailData(with: pokemon.id)
            .onSuccess { (pokemonModels: PokemonModels) in
                DispatchQueue.main.async {
                    let coordinator: PokemonDetailsCoordinator = PokemonDetailsCoordinator(
                        delegate: self,
                        navigationController: self.navigationController,
                        pokemonModels: pokemonModels
                    )
                    coordinator.start()
                    self.add(childCoordinator: coordinator)
                }

        }

    }
}

extension PokemonListCoordinator: PokemonDetailsCoordinatorDelegate {
    func dismiss(coordinator: PokemonDetailsCoordinator) {
        self.remove(childCoordinator: coordinator)
        self.navigationController.navigationBar.barTintColor = UIColor.red
    }

}
