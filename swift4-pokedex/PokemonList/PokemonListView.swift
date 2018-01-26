//
//  PokemonListView.swift
//  swift4-pokedex
//
//  Created by FFUF on 17.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import SnapKit

class PokemonListView: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubviewsForAutoLayout([collectionView])
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(20, 20, 0, 20))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
