//
//  AppDelegate.swift
//  Profile
//
//

import UIKit
import AlamofireNetworkActivityIndicator

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureUI()
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if UIDevice.isiPad() {
            return .all
        }
        return .portrait
    }
    
    private func configureUI() {
        NetworkActivityIndicatorManager.shared.isEnabled = true
        window?.tintColor = UIColor.themeColor
        
        if DBManager.isUserLoggedIn() {
            Router.displayRootTab()
        }
    }
}

