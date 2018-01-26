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
    
    //MARK: Delagate Properties
    let pokemonListService: PokemonListService = PokemonListService()
    
    //MARK: Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    //MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    
    //MARK: Computed Properties
    
    //MARK: Instance Methods
    public override func start() {
        let vc: PokemonListVC = PokemonListVC(delegate: self, navigationController: self.navigationController)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}

extension PokemonListCoordinator: PokemonListVCDelegate {
    func pokemonTapped(pokemon: Pokemon) {
        self.pokemonListService.getPokemonDetailData(with: pokemon.id)
            .onSuccess { (pokemonModels: PokemonModels) in
                pokemonModels.pokemonDetails.stats.forEach({ (pokemon) in
                    print("\(pokemon.stat.name): \(pokemon.baseStat)")
                })
                
                var pokemonTypes = [String]()
                
                pokemonModels.pokemonDetails.types.forEach({ (pokemon) in
                    pokemonTypes.append(pokemon.type.name)
                })
                print("Type: \(pokemonTypes.joined(separator: "/"))")
                
                pokemonModels.pokemonEvolution.pokemonEvolutionNodes.forEach({ (pokemonNodes) in
                    print(pokemonNodes.id)
                    print(pokemonNodes.name)
                })
                
                
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


