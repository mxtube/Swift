//
//  PhotoDetail.swift
//  PhotoCloud
//
//  Created by Кирилл Кузнецов on 18.03.2022.
//

import UIKit
import SDWebImage

// Class detail photo
class PhotoDetail: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    var image: URL?
        
    override func viewWillAppear(_ animated: Bool) {
        picture.sd_setImage(with: image!)
    }

}
