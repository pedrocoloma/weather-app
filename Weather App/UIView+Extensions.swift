//
//  UIView+Extensions.swift
//  Weather App
//
//  Created by Pedro Coloma on 29/12/23.
//

import UIKit

extension UIView {
    func setConstraintsToParent(_ parent: UIView,
                                top: CGFloat = 0,
                                _ leading: CGFloat = 0,
                                _ trailing: CGFloat = 0,
                                _ bottom: CGFloat = 0) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: top),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: leading),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: trailing),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: bottom)
        ])
    }
}
