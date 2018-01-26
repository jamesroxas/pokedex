//
//  PokemonDetailsDescriptionCell.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import SnapKit

public class PokemonDetailsDescriptionCell: UICollectionViewCell {

    private let pokemonEvolutionsTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "     Evolution(s):"
        view.textColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 16.0)
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIViewContentMode.scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private let pokemonFlavorLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        view.numberOfLines = 0
        return view
    }()

    private let pokemonHeightTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Height:"
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonWeightTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Weight:"
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonIDTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "ID:"
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonTypeTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Type:"
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonHeightLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonWeightLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonIDLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonTypeLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private lazy var pokemonBodyStackView: UIStackView = { [unowned self] in
        let view = UIStackView(arrangedSubviews: [
            self.pokemonHeightLabel,
            self.pokemonWeightLabel
            ]
        )
        view.axis = UILayoutConstraintAxis.vertical
        view.distribution = UIStackViewDistribution.fillEqually
        view.alignment = UIStackViewAlignment.fill
        view.spacing = 5.0

        return view
    }()

    private lazy var pokemonIdentifierStackView: UIStackView = { [unowned self] in
        let view = UIStackView(arrangedSubviews: [
            self.pokemonIDLabel,
            self.pokemonTypeLabel
            ]
        )
        view.axis = UILayoutConstraintAxis.vertical
        view.distribution = UIStackViewDistribution.fillEqually
        view.alignment = UIStackViewAlignment.fill
        view.spacing = 5.0

        return view
    }()

    private lazy var pokemonStackView: UIStackView = { [unowned self] in
        let view = UIStackView(arrangedSubviews: [
            self.pokemonBodyStackView,
            self.pokemonIdentifierStackView
            ]
        )
        view.axis = UILayoutConstraintAxis.horizontal
        view.distribution = UIStackViewDistribution.fillEqually
        view.alignment = UIStackViewAlignment.fill
        view.spacing = 2.0

        return view
    }()

    private let pokemonEvolutionImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIViewContentMode.scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private lazy var pokemonEvolutionStackView: UIStackView = { [unowned self] in
        let view = UIStackView()
        view.axis = UILayoutConstraintAxis.horizontal
        view.distribution = UIStackViewDistribution.fillEqually
        view.alignment = UIStackViewAlignment.fill

        return view
    }()

    public override init(frame: CGRect) { //swiftlint:disable:this function_body_length
        super.init(frame: frame)
        self.setSubviewsForAutoLayout([
            self.pokemonImageView, self.pokemonFlavorLabel,
            self.pokemonHeightTitleLabel, self.pokemonHeightLabel,
            self.pokemonWeightTitleLabel, self.pokemonWeightLabel,
            self.pokemonIDTitleLabel, self.pokemonIDLabel,
            self.pokemonTypeTitleLabel, self.pokemonTypeLabel,
            self.pokemonEvolutionsTitleLabel, self.pokemonEvolutionStackView
            ]
        )

        self.pokemonImageView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10.0)
            make.width.equalTo(100.0)
            make.height.equalTo(100.0)
        }

        self.pokemonFlavorLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview()
            make.leading.equalTo(pokemonImageView.snp.trailing).offset(10.0)
            make.trailing.equalToSuperview().inset(10.0)
        }

        self.pokemonHeightTitleLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonImageView.snp.bottom).offset(50.0)
            make.leading.equalToSuperview().offset(10.0)
            make.height.equalTo(20.0)
            make.width.equalTo(50.0)
        }

        self.pokemonHeightLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonImageView.snp.bottom).offset(50.0)
            make.leading.equalTo(pokemonHeightTitleLabel.snp.trailing).offset(5.0)
            make.height.equalTo(20.0)
        }

        self.pokemonWeightTitleLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonHeightTitleLabel.snp.bottom).offset(5.0)
            make.leading.equalToSuperview().offset(10.0)
            make.height.equalTo(20.0)
            make.width.equalTo(50.0)
        }

        self.pokemonWeightLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonHeightLabel.snp.bottom).offset(5.0)
            make.leading.equalTo(pokemonWeightTitleLabel.snp.trailing).offset(5.0)
            make.height.equalTo(20.0)
        }

        self.pokemonIDTitleLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonImageView.snp.bottom).offset(50.0)
            make.leading.equalTo(pokemonHeightTitleLabel.snp.trailing).offset(150.0)
            make.height.equalTo(20.0)
        }

        self.pokemonIDLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonImageView.snp.bottom).offset(50.0)
            make.leading.equalTo(pokemonIDTitleLabel.snp.trailing).offset(5.0)
            make.height.equalTo(20.0)
        }

        self.pokemonTypeTitleLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonIDTitleLabel.snp.bottom).offset(5.0)
            make.leading.equalTo(pokemonWeightTitleLabel.snp.trailing).offset(150.0)
            make.height.equalTo(20.0)
        }

        self.pokemonTypeLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonIDLabel.snp.bottom).offset(5.0)
            make.leading.equalTo(pokemonTypeTitleLabel.snp.trailing).offset(5.0)
            make.height.equalTo(20.0)
        }

        self.pokemonEvolutionsTitleLabel.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonWeightTitleLabel.snp.bottom).offset(10.0)
            make.left.right.equalToSuperview()
            make.height.equalTo(40.0)
        }

        self.pokemonEvolutionStackView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(pokemonEvolutionsTitleLabel.snp.bottom).offset(100.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(100.0)
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonDetailsDescriptionCell: Configurable {
    public static var identifier: String = "PokemonDetailsDescriptionCell"

    public func configure(with viewModel: PokemonDescriptionViewModel) {

        self.pokemonFlavorLabel.text = viewModel.description
        self.pokemonImageView.image = UIImage(named: viewModel.imageName)

        self.pokemonHeightTitleLabel.textColor = viewModel.colorType
        self.pokemonWeightTitleLabel.textColor = viewModel.colorType
        self.pokemonIDTitleLabel.textColor = viewModel.colorType
        self.pokemonTypeTitleLabel.textColor = viewModel.colorType

        self.pokemonHeightLabel.text = viewModel.height
        self.pokemonWeightLabel.text = viewModel.weight
        self.pokemonIDLabel.text = viewModel.id
        self.pokemonTypeLabel.text = viewModel.type

        self.pokemonEvolutionsTitleLabel.backgroundColor = viewModel.colorType

        viewModel.pokemonEvolutionNodes.forEach { (pokemonEvolution) in
            let imageView: UIImageView = UIImageView()
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "\(pokemonEvolution.id)")

            self.pokemonEvolutionStackView.addArrangedSubview(imageView)
        }

    }
}
