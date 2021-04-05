//
//  Profile.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import Foundation
import RealmSwift

final class Profile: Object, Decodable {
    @objc dynamic var  picture: String?
    @objc dynamic var  name: String?
    @objc dynamic var  gender: String?
    @objc dynamic var  age: Int = 0
    @objc dynamic var  favoriteColor: String?
    @objc dynamic var  _id: String?
    @objc dynamic var  email: String?
    @objc dynamic var  isFav: Bool = false
    
    override class func primaryKey() -> String? {
        "_id"
    }
    enum CodingKeys: String, CodingKey {
        case favoriteColor, picture, name, gender, age, _id, email
    }
}
