//
//  PokemonDetailsVC.swift
//  swift4-pokedex
//
//  Created by FFUF on 24/01/2018.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import IGListKit

public final class PokemonDetailsVC: JAViewController {
    // MARK: Delegate Properties
    private unowned let pokemonDetailsVCDelegate: PokemonDetailsVCDelegate

    // MARK: Initializer
    unowned var collectionView: UICollectionView { return self.pokemonDetailsView.collectionView }

    public init(delegate: PokemonDetailsVCDelegate, pokemonModels: PokemonModels, navigationController: UINavigationController) {
        self.pokemonDetailsVCDelegate = delegate
        self.pokemonModels = pokemonModels
        self.pokemonDescriptionViewModel = PokemonDescriptionViewModel(model: pokemonModels)
        self.pokemonStatsViewModel = PokemonStatsViewModel(model: pokemonModels)
        self.navController = navigationController
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Controller Lifecycle Methods
    public override func loadView() {
        self.view = PokemonDetailsView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(
            PokemonDetailsDescriptionCell.self,
            forCellWithReuseIdentifier: PokemonDetailsDescriptionCell.identifier
        )
        self.collectionView.register(PokemonDetailsStatsCell.self, forCellWithReuseIdentifier: PokemonDetailsStatsCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.pokemonDetailsView.segmentedControl.addTarget(
            self,
            action: #selector(self.segmentedControlPressed(_:)),
            for: UIControlEvents.valueChanged
        )
        self.pokemonDetailsView.segmentedControl.tintColor = PokemonType(
            rawValue: self.pokemonModels.pokemonDetails.types.last!.type.name
            )?.color
        self.pokemonDetailsView.backBarButton.action = #selector(self.backButtonPressed)
        self.pokemonDetailsView.backBarButton.target = self
        self.pokemonDetailsView.pokemonNameLabel.text = pokemonModels.pokemonDetails.name.uppercasedFirstLetter
        self.navigationItem.titleView = self.pokemonDetailsView.pokemonNameLabel
        self.navigationItem.leftBarButtonItem = self.pokemonDetailsView.backBarButton

    }

    // MARK: Deinitialization

    // MARK: Stored Properties
    private var navController: UINavigationController
    private var pokemonModels: PokemonModels
    private let pokemonDescriptionViewModel: PokemonDescriptionViewModel
    private let pokemonStatsViewModel: PokemonStatsViewModel

    // MARK: Computed Properties

}

// MARK: Views
private extension PokemonDetailsVC {
    private weak var pokemonDetailsView: PokemonDetailsView! {
        return self.view as! PokemonDetailsView //swiftlint:disable:this force_cast

    }
}

// MARK: - Target Action Functions
private extension PokemonDetailsVC {
    @objc func backButtonPressed() {
        self.pokemonDetailsVCDelegate.backButtonPressed()
    }

    @objc func segmentedControlPressed(_ control: UISegmentedControl) {
        let selectedSegmentIndex = self.pokemonDetailsView.segmentedControl.selectedSegmentIndex
        let indexPath = IndexPath(item: selectedSegmentIndex, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }

}

extension PokemonDetailsVC: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell: PokemonDetailsDescriptionCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PokemonDetailsDescriptionCell.identifier,
                for: indexPath
                ) as! PokemonDetailsDescriptionCell //swiftlint:disable:this force_cast
            cell.configure(with: self.pokemonDescriptionViewModel)
            return cell
        case 1:
            let cell: PokemonDetailsStatsCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PokemonDetailsStatsCell.identifier,
                for: indexPath
                ) as! PokemonDetailsStatsCell //swiftlint:disable:this force_cast
            cell.configure(with: self.pokemonStatsViewModel)
            return cell
        default:
            fatalError("Invalid row")
        }
    }
}
extension PokemonDetailsVC: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height-50)
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        if scrollView.contentOffset.x == 0.0 {
            self.pokemonDetailsView.segmentedControl.selectedSegmentIndex = 0
        }

        if scrollView.contentOffset.x == self.view.frame.width {
            self.pokemonDetailsView.segmentedControl.selectedSegmentIndex = 1
        }
    }

}
