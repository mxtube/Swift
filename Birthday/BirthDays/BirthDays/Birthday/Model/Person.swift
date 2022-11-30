//
//  Person.swift
//  BirthDays
//
//  Created by Кирилл Кузнецов on 31.03.2022.
//

import Foundation
import RealmSwift

class Person: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var date: String = ""
    
}
