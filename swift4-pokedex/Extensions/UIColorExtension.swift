//
//  PokemonTypeColor.swift
//  swift4-pokedex
//
//  Created by FFUF on 25/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit

extension UIColor {
    func pokemonColor(type: String) -> UIColor {
        switch type {
        case "normal":
            return UIColor(
                red: 168.0/255.0,
                green: 167.0/255.0,
                blue: 122.0/255.0,
                alpha: 1.0
            )
        case "fire":
            return UIColor(
                red: 238.0/255.0,
                green: 129.0/255.0,
                blue: 48.0/255.0,
                alpha: 1.0
            )
        case "water":
            return UIColor(
                red: 99.0/255.0,
                green: 144.0/255.0,
                blue: 240.0/255.0,
                alpha: 1.0
            )
        case "electric":
            return UIColor(
                red: 247.0/255.0,
                green: 208.0/255.0,
                blue: 44.0/255.0,
                alpha: 1.0
            )
        case "grass":
            return UIColor(
                red: 122.0/255.0,
                green: 208.0/255.0,
                blue: 44.0/255.0,
                alpha: 1.0
            )
        case "ice":
            return UIColor(
                red: 150.0/255.0,
                green: 217.0/255.0,
                blue: 214.0/255.0,
                alpha: 1.0
            )
        case "fighting":
            return UIColor(
                red: 194.0/255.0,
                green: 46.0/255.0,
                blue: 40.0/255.0,
                alpha: 1.0
            )
        case "poison":
            return UIColor(
                red: 163.0/255.0,
                green: 62.0/255.0,
                blue: 161.0/255.0,
                alpha: 1.0
            )
        case "ground":
            return UIColor(
                red: 226.0/255.0,
                green: 191.0/255.0,
                blue: 101.0/255.0,
                alpha: 1.0
            )
        case "flying":
            return UIColor(
                red: 169.0/255.0,
                green: 143.0/255.0,
                blue: 243.0/255.0,
                alpha: 1.0
            )
        case "psychic":
            return UIColor(
                red: 249.0/255.0,
                green: 85.0/255.0,
                blue: 135.0/255.0,
                alpha: 1.0
            )
        case "bug":
            return UIColor(
                red: 166.0/255.0,
                green: 185.0/255.0,
                blue: 26.0/255.0,
                alpha: 1.0
            )
        case "rock":
            return UIColor(
                red: 182.0/255.0,
                green: 161.0/255.0,
                blue: 54.0/255.0,
                alpha: 1.0
            )
        case "ghost":
            return UIColor(
                red: 115.0/255.0,
                green: 87.0/255.0,
                blue: 151.0/255.0,
                alpha: 1.0
            )
        case "dragon":
            return UIColor(
                red: 111.0/255.0,
                green: 53.0/255.0,
                blue: 252.0/255.0,
                alpha: 1.0
            )
        case "dark":
            return UIColor(
                red: 112.0/255.0,
                green: 87.0/255.0,
                blue: 70.0/255.0,
                alpha: 1.0
            )
        case "steel":
            return UIColor(
                red: 183.0/255.0,
                green: 183.0/255.0,
                blue: 206.0/255.0,
                alpha: 1.0
            )
        case "fairy":
            return UIColor(
                red: 217.0/255.0,
                green: 133.0/255.0,
                blue: 173.0/255.0,
                alpha: 1.0
            )
        default:
            return UIColor.black
        }
    }
}
