//
//  RoundedButton.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 21.04.2022.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var borderRadius: CGFloat = 10.0 {
        didSet { self.layer.cornerRadius = borderRadius }
    }
    
    @IBInspectable var imageRadius: CGFloat = 0.0 {
        didSet { self.imageView?.layer.cornerRadius = imageRadius }
    }
    
}
