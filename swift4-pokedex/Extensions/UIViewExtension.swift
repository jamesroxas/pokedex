//
//  UIViewExtension.swift
//  swift4-pokedex
//
//  Created by FFUF on 17.01.18.
//  Copyright © 2018 FFUF. All rights reserved.
//

import UIKit

extension UIView {

    internal func setSubviewForAutoLayout(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }

    internal func setSubviewsForAutoLayout(_ subviews: [UIView]) {
        _ = subviews.map { self.setSubviewForAutoLayout($0) }
    }
}
