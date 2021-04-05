//
//  DBManager.swift
//  Profile
//
//  Created by Rathi on 05/04/21.
//

import Foundation
import RealmSwift

final class DBManager {
    class func isUserLoggedIn() -> Bool {
        let realm = try! Realm()
        if let _ = realm.objects(User.self).last {
            return true
        } else {
            return false
        }
    }
    
    class func getUserObject() -> User? {
        let realm = try! Realm()
        return realm.objects(User.self).last
    }
    class func getProfileList() -> Results<Profile>? {
        let realm = try! Realm()
        return realm.objects(Profile.self)
    }
    
    class func saveData(_ object: Object) {
        let realm = try! Realm()
        try? realm.write {
            realm.add(object)
        }
    }
    class func saveData(_ object: [Object]) {
        let realm = try! Realm()
        try? realm.write {
            realm.add(object)
        }
    }
    
    class func logoutuser() {
        let realm = try! Realm()
        try? realm.write {
            realm.deleteAll()
        }
    }
    class func updateFavStatus(_ profileID: String, isFav: Bool) {
        let realm = try! Realm()
        if let obj = realm.object(ofType: Profile.self, forPrimaryKey: profileID) {
            
            try? realm.write {
                obj.isFav = isFav
            }
        }
    }
}
