//
//  PokemonDetailSectionController.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import IGListKit

public final class PokemonDetailsSectionController: ListSectionController {

    public override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width,
                      height: collectionContext!.containerSize.height)
    }

    public override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(
            of: PokemonDetailsDescriptionCell.self,
            for: self,
            at: index
            ) as! PokemonDetailsDescriptionCell //swiftlint:disable:this force_cast

        return cell
    }

    public override func didUpdate(to object: Any) {

    }

    public override func didSelectItem(at index: Int) {

    }
}
