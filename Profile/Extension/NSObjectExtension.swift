//
//  NSObjectExtension.swift
//  Profile
//
//

import UIKit

extension NSObject {
    
    class var className: String {
        String(describing: self)
    }
    var className: String {
        String(describing: type(of: self))
    }
}
