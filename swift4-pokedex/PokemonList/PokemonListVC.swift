//
//  PokemonListVC.swift
//  swift4-pokedex
//
//  Created by FFUF on 17.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid
import Result
import IGListKit
import FSwiftNetworking

class PokemonListVC: UIViewController {
    
    // MARK: Delegate Properties
    private let delegate: PokemonListVCDelegate
    
    // MARK: Initializers
    weak var pokemonListView: PokemonListView! { return self.view as! PokemonListView }
    unowned var collectionView: UICollectionView { return self.pokemonListView.collectionView }
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    public init(delegate: PokemonListVCDelegate, navigationController: UINavigationController) {
        self.delegate = delegate
        self.navController = navigationController
        
        super.init(nibName: nil, bundle: nil)
        
        let datas = CSV().data(filename: "pokemon")
        
        for i in 1...718 {
            let pokemon = Pokemon(id: Int(datas[i][0])!, name: datas[i][1], height: datas[i][3], weight: datas[i][4])
            pokemonList.append(pokemon)
        }
        
        self.dataSource = PokemonListDataSource(delegate: self, pokemonList: pokemonList)
        self.adapter.collectionView = self.collectionView
        self.adapter.dataSource = self.dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIViewController Lifecycle Methods
    override func loadView() {
        self.view = PokemonListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navController.navigationBar.barTintColor = UIColor.red
    }
    
    // MARK: Stored Properties
    private unowned var navController: UINavigationController
    var dataSource: PokemonListDataSource!
    var pokemonList = [Pokemon]()
    
    // MARK: Computed Properties
    
    // MARK: Instance Methods
    
}

extension PokemonListVC: PokemonListSectionControllerDelegate {
    public func selected(pokemon: Pokemon) {
        self.delegate.pokemonTapped(pokemon: pokemon)
        print("Tapped")
    }
}
