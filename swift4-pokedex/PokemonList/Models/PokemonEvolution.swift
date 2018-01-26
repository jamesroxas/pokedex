//
//  PokemonEvolution.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import Rapid

struct Species: Decodable {
    var url: URL
    var name: String
}

struct NextEvolution: Decodable {
    var species: Species
    var chain: [Chain]
    enum CodingKeys: String, CodingKey {
        case species = "species"
        case chain = "evolves_to"
    }
}

struct Chain: Decodable {
    var species: Species
    var nextEvolution: [NextEvolution]?
    enum CodingKeys: String, CodingKey {
        case species = "species"
        case nextEvolution = "evolves_to"
    }
}

struct EvolutionDecodable: Decodable {
    var chain: Chain
    enum CodingKeys: String, CodingKey {
        case chain
    }

}

public class PokemonEvolution: JAObject {
    var pokemonEvolutionNodes: [PokemonEvolutionNode] = [PokemonEvolutionNode]()

    fileprivate static func getEvolutionChain(nextChain: Chain, evolutions: inout [PokemonEvolutionNode]) -> [PokemonEvolutionNode] {

        let pokemonID = Int(nextChain.species.url.lastPathComponent)!
        let pokemonName = nextChain.species.name
        evolutions.append(PokemonEvolutionNode(id: pokemonID, name: pokemonName))
        if let nextEvolve = nextChain.nextEvolution {
            if nextEvolve.count > 0 {
                let nextPokemonID = Int(nextEvolve[0].species.url.lastPathComponent)!
                let nextPokemonName = nextEvolve[0].species.name

                evolutions.append(PokemonEvolutionNode(id: nextPokemonID, name: nextPokemonName))
                if nextEvolve[0].chain.count > 0 {
                    _ = self.getEvolutionChain(
                        nextChain: nextEvolve[0].chain[0],
                        evolutions: &evolutions
                    )
                }
            }
        }

        return evolutions
    }

    public init(data: Data) throws {
        do {
            let decoder = try JSONDecoder().decode(EvolutionDecodable.self, from: data)
            let nextChain = decoder.chain
            self.pokemonEvolutionNodes = PokemonEvolution.getEvolutionChain(
                nextChain: nextChain,
                evolutions: &pokemonEvolutionNodes
            )

        } catch {
            fatalError(error.localizedDescription)
        }
    }

}
