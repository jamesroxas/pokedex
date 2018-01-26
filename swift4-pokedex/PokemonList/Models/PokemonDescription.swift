//
//  PokemonFlavor.swift
//  swift4-pokedex
//
//  Created by FFUF on 23/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import Rapid

struct Version: Decodable {
    let url: URL
    let name: String
}

struct Language: Decodable {
    let url: URL
    let name: String
}

struct Flavor: Decodable {
    let version: Version
    let text: String
    let language: Language
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case text = "flavor_text"
        case language = "language"
    }
}

struct EvolutionChain: Decodable {
    let url: URL
}

fileprivate struct PokemonSpeciesDecodable: Decodable {
    let flavor: [Flavor]
    let evolutionChain: EvolutionChain
    
    enum CodingKeys: String, CodingKey {
        case flavor = "flavor_text_entries"
        case evolutionChain = "evolution_chain"
    }
}

public class PokemonSpecies: JAObject {
    let flavor: [Flavor]
    let evolution: URL
    
    public init(data: Data) throws {
        do {
            let decoder = try JSONDecoder().decode(PokemonSpeciesDecodable.self, from: data)
            
            self.flavor = decoder.flavor
            self.evolution = decoder.evolutionChain.url
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
