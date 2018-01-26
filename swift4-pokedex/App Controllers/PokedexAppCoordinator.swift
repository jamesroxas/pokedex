//
//  AppCoordinator.swift
//  swift4-pokedex
//
//  Created by FFUF on 19.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit
import Rapid

public final class PokedexAppCoordinator: AppCoordinator<UINavigationController> {

    public override init(window: UIWindow, rootViewController: UINavigationController) {
        super.init(window: window, rootViewController: rootViewController)
        self.window.backgroundColor = UIColor.white
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()

        self.rootViewController.navigationController?.navigationBar.isTranslucent = false
    }

    override public func start() {
        let coordinator: PokemonListCoordinator = PokemonListCoordinator(
            navigationController: self.rootViewController
        )
        coordinator.start()
        self.add(childCoordinator: coordinator)
    }
}
