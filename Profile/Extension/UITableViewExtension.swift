//
//  UITableViewExtension.swift
//  Profile
//
//
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(_ className: T.Type, indexPath: IndexPath) -> T {
        let className = String.getClassString(className)
        return dequeueReusableCell(withIdentifier: className, for: indexPath) as! T 
    }
    
    func registerNib(_ className: AnyClass) {
        let classNameString = String.getClassString(className)
        register(UINib(nibName: classNameString, bundle: .main), forCellReuseIdentifier: classNameString)
    }
    
    func removeBackgroundMessage() {
        backgroundView = nil
    }
    
    func addNoContentBackgroundView(_ message: String) {
        let label = UILabel()
        label.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = message
        label.sizeToFit()
        backgroundView = label
    }
}
