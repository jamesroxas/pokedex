//
//  PokemonModel.swift
//  swift4-pokedex
//
//  Created by FFUF on 18.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import Foundation
import Rapid
import IGListKit

public class Pokemon: JAObject {
    var id: Int
    var name: String
    var height: String
    var weight: String
    var image: UIImage

    init(id: Int, name: String, height: String, weight: String) {
        self.id = id
        self.name = name.uppercasedFirstLetter
        self.height = height
        self.weight = weight
        self.image = UIImage(named: String(id))!
    }
}

extension Pokemon: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self.id as NSObjectProtocol
    }
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Pokemon else { return false }

        return self.id == object.id && self.name == object.name && self.height == object.height && self.weight == object.weight
    }
}
