//
//  UIResponderExtesnion.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import UIKit

extension UIResponder {
    @objc func modifyFavStatus(_ profileID: String, isFav: Bool) {
        next?.modifyFavStatus(profileID, isFav: isFav)
    }
}
