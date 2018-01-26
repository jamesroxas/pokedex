//
//  PokemonListView.swift
//  swift4-pokedex
//
//  Created by FFUF on 17.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import SnapKit

public final class PokemonListView: UIView {

    // MARK: Subviews
    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubviewsForAutoLayout([collectionView])
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.left.equalToSuperview().offset(20.0)
            make.right.equalToSuperview().inset(20.0)
            make.bottom.equalToSuperview()
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
