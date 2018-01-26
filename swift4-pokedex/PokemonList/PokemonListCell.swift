//
//  PokemonListView.swift
//  swift4-pokedex
//
//  Created by FFUF on 17.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import SnapKit

public class PokemonListCell: UICollectionViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.blue
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    fileprivate lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [
            self.nameLabel,
            self.heightLabel,
            self.weightLabel
            ]
        )
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.alignment = UIStackViewAlignment.fill
        stackView.spacing = 0.0
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubviewsForAutoLayout([self.imageView, stackView])
    
        self.imageView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.size.equalTo(50.0)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20.0)
        }
        
        self.stackView.snp.remakeConstraints { (make) in
            make.size.equalTo(100.0)
            make.left.equalTo(imageView.snp.right).offset(20.0)
            make.centerY.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonListCell: Configurable {
    public static var identifier: String = "PokedexListCell"
    
    public func configure(with viewModel: PokemonListViewModel) {
        self.nameLabel.text = viewModel.name
        self.heightLabel.text = viewModel.height
        self.weightLabel.text = viewModel.weight
        self.imageView.image  = viewModel.image
    }
}
