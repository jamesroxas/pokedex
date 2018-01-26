//
//  UIStringExtension.swift
//  swift4-pokedex
//
//  Created by FFUF on 26/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation

extension String {
    var uppercasedFirstLetter: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}
