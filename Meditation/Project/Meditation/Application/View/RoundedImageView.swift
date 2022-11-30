//
//  RoundedImageView.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 22.04.2022.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var borderRadius: CGFloat = 0.0 {
        didSet { self.layer.cornerRadius = borderRadius }
    }
    
}
