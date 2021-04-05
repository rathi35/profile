//
//  Router.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import UIKit

class Router {
    
    class func displayRootTab() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let tabbar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Tabbar")
        appdelegate.window?.rootViewController = tabbar
    }
    
    class func showSignUpScreen() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        appdelegate.window?.rootViewController = vc
    }
    
    class func showFavScreen(_ from: UIViewController) {
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        vc.type = .favourite
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
