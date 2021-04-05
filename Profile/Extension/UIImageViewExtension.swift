//
//  UIImageViewExtension.swift
//  Profile
//
//
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageWithAnimation(imagePath: String?, placeHolderImageName: String? = "", imageTransition: Bool = true) {
        guard let imageurl = imagePath, !imageurl.isEmpty else {
            return
        }
        setImage(imagePath: imageurl, placeHolderImageName: placeHolderImageName, imageTransition: imageTransition)
    }
    
    func cancelLoading() {
        kf.cancelDownloadTask()
    }
    
    private func setImage(imagePath: String?, placeHolderImageName: String?, imageTransition: Bool) {
        var placeHolderImage: UIImage?
        if let placeHolderName = placeHolderImageName, !placeHolderName.isEmpty {
            if let actualImage = UIImage(named: placeHolderName) {
                placeHolderImage =  actualImage
            }
        }
        
        if let url = URL(string: imagePath ?? "") {
            kf.setImage(with: url, placeholder: placeHolderImage, options: [.transition(.fade(imageTransition ? 0.5 : 0.0)), .cacheOriginalImage], completionHandler:  nil)
        } else {
            self.image = placeHolderImage
        }
    }
}
