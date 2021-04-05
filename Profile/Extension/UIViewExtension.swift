//
//  UIViewExtension.swift
//  Profile
//
//

import UIKit
import QuartzCore

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
        }
    }
    func setShadow(color: UIColor = UIColor.lightGray, shadowRadius: CGFloat = 4, offsetHeight: CGFloat) {
        layer.cornerRadius = shadowRadius
        layer.shadowOffset = CGSize(width: 0, height: offsetHeight)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            debugPrint("called before adding as subview")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["subview": self]))
    }
}
