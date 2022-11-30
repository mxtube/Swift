//
//  User.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 21.04.2022.
//

import Foundation
import RealmSwift

struct User {

    var email: String?
    var token: String?
    var name: String?
    var avatar: String?
    
    let userDefault = UserDefaults.standard
    
    func saveToken() {
        userDefault.set(token, forKey: "token")
        userDefault.set(name, forKey: "name")
        userDefault.set(email, forKey: "email")
        userDefault.set(avatar, forKey: "avatar")
    }
    
    func getUserName() -> String {
        return userDefault.value(forKey: "name") as! String
    }
    
    func getUserAvatarUrl() -> URL {
        let urlString = userDefault.value(forKey: "avatar")
        let url = URL(string: urlString as! String)
        return url!
    }
    
    func signOut() {
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "token")
        userDefault.removeObject(forKey: "avatar")
        userDefault.removeObject(forKey: "name")
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
