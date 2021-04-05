//
//  AccountViewModel.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import Foundation

final class AccountViewModel {
    
    func getUser() -> User? {
        DBManager.getUserObject()
    }
    
    func logoutAction() {
        DBManager.logoutuser()
    }
}
