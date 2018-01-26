//
//  PokemonListService.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import BrightFutures
import FSwiftNetworking

public class PokemonListService {

    private let networkQueue: DispatchQueue = DispatchQueue(
        label: "NetworkQueue",
        qos: DispatchQoS.utility,
        attributes: DispatchQueue.Attributes.concurrent
    )

    private func getPokemonData(with PokemonID: Int) -> Future<PokemonDetails, NetworkingError> {
        let request: Request = PokemonRequest(id: PokemonID)
        let dispatcher: RequestDispatcher = JSONRequestDispatcher(request: request)

        return dispatcher.dispatchURLRequest()
            .map(networkQueue.context) { (response: Response) -> PokemonDetails in
                do {

                    return try PokemonDetails(data: response.data)

                } catch {

                    fatalError(error.localizedDescription)

                }
        }
    }

    private func getPokemonSpeciesData(with PokemonID: Int) -> Future<PokemonSpecies, NetworkingError> {
        let request: Request = PokemonSpeciesRequest(id: PokemonID)
        let dispatcher: RequestDispatcher = JSONRequestDispatcher(request: request)

        return dispatcher.dispatchURLRequest()
            .map(networkQueue.context) { (response: Response) -> PokemonSpecies in
                do {

                    return try PokemonSpecies(data: response.data)

                } catch {

                    fatalError(error.localizedDescription)

                }
        }
    }

    private func getPokemonEvolutionChainData(with PokemonSpeciesID: Int) -> Future<PokemonEvolution, NetworkingError> {
        let request: Request = PokemonEvolutionChainRequest(id: PokemonSpeciesID)
        let dispatcher: RequestDispatcher = JSONRequestDispatcher(request: request)

        return dispatcher.dispatchURLRequest()
            .map(networkQueue.context) { (response: Response) -> PokemonEvolution in
                do {

                    return try PokemonEvolution(data: response.data)

                } catch {

                    fatalError(error.localizedDescription)

                }
        }
    }

    func getPokemonDetailData(with pokemonID: Int) -> Future<PokemonModels, NetworkingError> {

        return self.getPokemonData(with: pokemonID)
            .zip(self.getPokemonSpeciesData(with: pokemonID))
             .flatMap({(pokemonDetails: PokemonDetails, pokemonSpecies: PokemonSpecies) -> Future<PokemonModels, NetworkingError> in //swiftlint:disable:this line_length
                let evolutionID = Int(pokemonSpecies.evolution.lastPathComponent)!
                return self.getPokemonEvolutionChainData(with: evolutionID)
                    .map({ (pokemonEvolution: PokemonEvolution) -> PokemonModels in
                        return PokemonModels(
                            pokemonDetails: pokemonDetails,
                            pokemonSpecies: pokemonSpecies,
                            pokemonEvolution: pokemonEvolution
                        )
                    })
            })

//        return self.getPokemonData(with: pokemonID)
//            .flatMap({ (pokemonDetails: PokemonDetails) -> Future<PokemonModels, NetworkingError> in
//
//                return self.getPokemonSpeciesData(with: pokemonID)
//                    .map({ (pokemonSpecies: PokemonSpecies) -> PokemonModels in
//
//                        return PokemonModels(
//                            pokemonDetails: pokemonDetails,
//                            pokemonSpecies: pokemonSpecies
//                        )
//                    })
//            })
    }
}
