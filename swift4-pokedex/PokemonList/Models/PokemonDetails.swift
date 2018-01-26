//
//  PokemonStat.swift
//  swift4-pokedex
//
//  Created by FFUF on 23/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import Rapid

struct Stat: Decodable {
    let url: String
    let name: String
}

struct Stats: Decodable {
    let stat: Stat
    let effort: Int
    let baseStat: Int
    
    enum CodingKeys: String, CodingKey {
        case stat
        case effort
        case baseStat = "base_stat"
    }
}

struct Type: Decodable {
    let url: String
    let name: String
}

struct Types: Decodable {
    let slot: Int
    let type: Type
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}

fileprivate struct PokemonDetailsDecodable: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let stats: [Stats]
    let types: [Types]
}

public class PokemonDetails: JAObject {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let stats: [Stats]
    let types: [Types]
    
    public init(data: Data) throws {
        do {
            let decoder = try JSONDecoder().decode(PokemonDetailsDecodable.self, from: data)
            
            self.id = decoder.id
            self.name = decoder.name
            self.height = decoder.height
            self.weight = decoder.weight
            self.stats = decoder.stats
            self.types = decoder.types
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}

