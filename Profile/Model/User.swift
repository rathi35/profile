//
//  User.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import Foundation
import RealmSwift

final class User: Object {
    @objc dynamic var name: String?
    @objc dynamic var gender: String?
    @objc dynamic var dob: String?
    @objc dynamic var image: Data?
    
    init(name: String, gender: String, dob: String, image: Data?) {
        self.name = name
        self.gender = gender
        self.dob = dob
        self.image = image
    }
    
    override init() {
        super.init()
    }
}

