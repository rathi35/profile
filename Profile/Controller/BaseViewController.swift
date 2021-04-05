//
//  BaseViewController.swift
//  Profile
//
//  Created by Rathi on 04/04/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var needFavButton: Bool = false
    var needbackgroundIMG: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if needFavButton {
            let item = UIBarButtonItem(image: #imageLiteral(resourceName: "heart").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(showFavListScreen))
            item.imageInsets.top = -2
            item.accessibilityLabel = "Favourite"
            if #available(iOS 11.0, *) {
                item.largeContentSizeImageInsets = .zero
                item.largeContentSizeImage = #imageLiteral(resourceName: "heart_filled").withRenderingMode(.alwaysTemplate)
            }
            navigationItem.rightBarButtonItem = item
            
        }
        if needbackgroundIMG {
            let imageview = UIImageView()
            imageview.contentMode = .scaleToFill
            imageview.image = #imageLiteral(resourceName: "bg_pattern")
            view.addSubview(imageview)
            imageview.bindFrameToSuperviewBounds()
            view.sendSubviewToBack(imageview)
        }
    }
    
    @objc func showFavListScreen() {
        Router.showFavScreen(self)
    }
}
