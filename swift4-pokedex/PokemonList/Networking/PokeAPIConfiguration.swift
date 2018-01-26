//
//  PokeAPIConfiguration.swift
//  swift4-pokedex
//
//  Created by FFUF on 19.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import FSwiftNetworking

struct PokeAPIConfiguration: RequestConfiguration {

    var scheme: URLScheme {
        return URLScheme.http
    }

    var host: String {
        return "pokeapi.co"
    }

    var basePathComponents: [String] {
        return [
            "api",
            "v2"
        ]
    }

    var baseHeaders: [String: Any] {
        return [
            "Content-Type": "application/json"
        ]
    }
}
