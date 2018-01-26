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

public class PokemonDetailsStatsCell: UICollectionViewCell {
    
    let pokemonHealthPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonAttackPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonDefensePlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonSpecialAttackPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonSpecialDefensePlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonSpeedPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    fileprivate lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.pokemonHealthPlaceholderLabel,
            self.pokemonAttackPlaceholderLabel,
            self.pokemonDefensePlaceholderLabel,
            self.pokemonSpecialAttackPlaceholderLabel,
            self.pokemonSpecialDefensePlaceholderLabel,
            self.pokemonSpeedPlaceholderLabel
            ]
        )
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.alignment = UIStackViewAlignment.fill
        stackView.spacing = 2.0
        return stackView
    }()
    
    fileprivate lazy var pokemonTitleLabels: [UILabel] = {
        var labels: [UILabel] = [
            self.pokemonHealthPlaceholderLabel, self.pokemonAttackPlaceholderLabel,
            self.pokemonDefensePlaceholderLabel, self.pokemonSpecialAttackPlaceholderLabel,
            self.pokemonSpecialDefensePlaceholderLabel, self.pokemonSpeedPlaceholderLabel
        ]
        return labels
    }()
    
    let pokemonHealthStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let pokemonAttackStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let pokemonDefenseStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    let pokemonSpecialAttackStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let pokemonSpecialDefenseStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let pokemonSpeedStatBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
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
    
    let pokemonHealthStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonAttackStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonDefenseStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonSpecialAttackStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonSpecialDefenseStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let pokemonSpeedStatValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    fileprivate lazy var pokemonStatValueLabels: [UILabel] = {
        var labels: [UILabel] = [
            self.pokemonHealthStatValueLabel, self.pokemonAttackStatValueLabel,
            self.pokemonDefenseStatValueLabel, self.pokemonSpecialAttackStatValueLabel,
            self.pokemonSpecialDefenseStatValueLabel, self.pokemonSpeedStatValueLabel
        ]
        return labels
    }()
    
    override init(frame: CGRect) {
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
