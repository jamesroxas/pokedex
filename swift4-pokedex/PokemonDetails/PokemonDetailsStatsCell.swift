//
//  PokemonDetailsStatsCell.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import SnapKit

public final class PokemonDetailsStatsCell: UICollectionViewCell {

    // MARK: Subviews
    private let pokemonHealthPlaceholderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonAttackPlaceholderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonDefensePlaceholderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonSpecialAttackPlaceholderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonSpecialDefensePlaceholderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    private let pokemonSpeedPlaceholderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.clear
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    fileprivate lazy var labelsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            self.pokemonHealthPlaceholderLabel,
            self.pokemonAttackPlaceholderLabel,
            self.pokemonDefensePlaceholderLabel,
            self.pokemonSpecialAttackPlaceholderLabel,
            self.pokemonSpecialDefensePlaceholderLabel,
            self.pokemonSpeedPlaceholderLabel
            ]
        )
        view.axis = UILayoutConstraintAxis.vertical
        view.distribution = UIStackViewDistribution.fillEqually
        view.alignment = UIStackViewAlignment.fill
        view.spacing = 2.0
        return view
    }()

    fileprivate lazy var pokemonTitleLabels: [UILabel] = {
        var view: [UILabel] = [
            self.pokemonHealthPlaceholderLabel, self.pokemonAttackPlaceholderLabel,
            self.pokemonDefensePlaceholderLabel, self.pokemonSpecialAttackPlaceholderLabel,
            self.pokemonSpecialDefensePlaceholderLabel, self.pokemonSpeedPlaceholderLabel
        ]
        return view
    }()

    private let pokemonHealthStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = PokemonStatColor.hp
        return view
    }()

    private let pokemonAttackStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = PokemonStatColor.atk
        return view
    }()

    private let pokemonDefenseStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = PokemonStatColor.def
        return view
    }()

    private let pokemonSpecialAttackStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = PokemonStatColor.spAtk
        return view
    }()

    private let pokemonSpecialDefenseStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = PokemonStatColor.spDef
        return view
    }()

    private let pokemonSpeedStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = PokemonStatColor.spd
        return view
    }()

    private var barMaxWidth: CGFloat {
        let viewWidth = self.bounds.width
        return (viewWidth - 220) / 200
    }

    fileprivate lazy var pokemonStatBarViews: [UIView] = {
        var views: [UIView] = [
            self.pokemonHealthStatBarView, self.pokemonAttackStatBarView,
            self.pokemonDefenseStatBarView, self.pokemonSpecialAttackStatBarView,
            self.pokemonSpecialDefenseStatBarView, self.pokemonSpeedStatBarView
        ]
        return views
    }()

    private let pokemonHealthStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    private let pokemonAttackStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    private let pokemonDefenseStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    private let pokemonSpecialAttackStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    private let pokemonSpecialDefenseStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    private let pokemonSpeedStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    private lazy var pokemonStatValueLabels: [UILabel] = {
        return [
            self.pokemonHealthStatValueLabel, self.pokemonAttackStatValueLabel,
            self.pokemonDefenseStatValueLabel, self.pokemonSpecialAttackStatValueLabel,
            self.pokemonSpecialDefenseStatValueLabel, self.pokemonSpeedStatValueLabel
        ]
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubviewsForAutoLayout([
            self.labelsStackView,
            self.pokemonHealthStatBarView,
            self.pokemonAttackStatBarView,
            self.pokemonDefenseStatBarView,
            self.pokemonSpecialAttackStatBarView,
            self.pokemonSpecialDefenseStatBarView,
            self.pokemonSpeedStatBarView,
            self.pokemonHealthStatValueLabel,
            self.pokemonAttackStatValueLabel,
            self.pokemonDefenseStatValueLabel,
            self.pokemonSpecialAttackStatValueLabel,
            self.pokemonSpecialDefenseStatValueLabel,
            self.pokemonSpeedStatValueLabel
            ]
        )

        self.labelsStackView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(125.0)
            make.height.equalTo(200.0)
        }

        for (statBarView, titleLabel) in zip(self.pokemonStatBarViews, self.pokemonTitleLabels) {
            statBarView.snp.remakeConstraints({ (make: ConstraintMaker) in
                make.leading.equalTo(labelsStackView.snp.trailing).offset(10.0)
                make.centerY.equalTo(titleLabel)
                make.height.equalTo(titleLabel).inset(4.0)
                make.width.equalTo(200.0)
            })
        }

        for (statValueLabel, statBarView) in zip(self.pokemonStatValueLabels, self.pokemonStatBarViews) {
            statValueLabel.snp.remakeConstraints({ (make: ConstraintMaker) in
                make.leading.equalTo(statBarView.snp.trailing).offset(10.0)
                make.centerY.equalTo(statBarView)
                make.height.equalTo(statBarView)
            })
        }

    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonDetailsStatsCell: Configurable {
    public static var identifier: String = "PokemonDetailsStatsCell"

    public func configure(with viewModel: PokemonStatsViewModel) {

        for (statValueLabel, pokemonStat) in zip(self.pokemonStatValueLabels, viewModel.pokemonDetails.stats.reversed()) {
            statValueLabel.text = String(pokemonStat.baseStat)
        }
        self.pokemonHealthPlaceholderLabel.text = viewModel.health
        self.pokemonAttackPlaceholderLabel.text = viewModel.attack
        self.pokemonDefensePlaceholderLabel.text = viewModel.defense
        self.pokemonSpecialAttackPlaceholderLabel.text = viewModel.specialAttack
        self.pokemonSpecialDefensePlaceholderLabel.text = viewModel.specialDefense
        self.pokemonSpeedPlaceholderLabel.text = viewModel.speed
        for (statBarView, pokemonStat) in zip(self.pokemonStatBarViews, viewModel.stats) {
            statBarView.snp.updateConstraints({ (make: ConstraintMaker) in

                let compute: CGFloat = (((CGFloat(pokemonStat.baseStat)) / 200.0) * self.barMaxWidth) * 100
                make.width.equalTo(compute)
            })

        }

    }
}
