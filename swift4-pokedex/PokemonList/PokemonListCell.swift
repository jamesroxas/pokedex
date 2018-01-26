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

public final class PokemonListCell: UICollectionViewCell {
    public let nameLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.center
        return view
    }()

    public let heightLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.center
        return view
    }()

    public let weightLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.center
        return view
    }()

    public let imageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.contentMode = UIViewContentMode.scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [
            self.nameLabel,
            self.heightLabel,
            self.weightLabel
        ])
        view.axis = UILayoutConstraintAxis.vertical
        view.distribution = UIStackViewDistribution.fillEqually
        view.alignment = UIStackViewAlignment.fill
        view.spacing = 0.0

        return view
    }()

    public override init(frame: CGRect) {
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
