//
//  Photo.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 23.04.2022.
//

import UIKit
import RealmSwift

class Photo: Object {
    
    @objc dynamic var photoData: Data?
    @objc dynamic var time: String?
    
}
