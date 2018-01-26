//
//  PokemonDetailsView.swift
//  swift4-pokedex
//
//  Created by FFUF on 23.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import SnapKit

class PokemonDetailsView: UIView {
    let backBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Back",
            style: UIBarButtonItemStyle.plain,
            target: nil,
            action: nil
        )
        button.tintColor = UIColor.white
        return button
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [
            "Description",
            "Stats"
            ]
        )
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokemon"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.white
        view.isPagingEnabled = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubviewsForAutoLayout([segmentedControl, collectionView])
        
        self.segmentedControl.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(80.0)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
            make.height.equalTo(30.0)
        }
        
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(self.segmentedControl.snp.bottom).offset(10.0)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
