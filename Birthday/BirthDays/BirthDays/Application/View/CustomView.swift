//
//  CustomStackView.swift
//  BirthDays
//
//  Created by Кирилл Кузнецов on 16.03.2022.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIStackView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet { self.layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var colorBorder: UIColor = .clear {
        didSet { self.layer.borderColor = colorBorder.cgColor }
    }
    
    @IBInspectable var widthBorder: CGFloat = 0.0 {
        didSet { self.layer.borderWidth = widthBorder }
    }
    
    @IBInspectable var edgeInsetsLeft: CGFloat = 0.0;
    @IBInspectable var edgeInsetsTop: CGFloat = 0.0;
    @IBInspectable var edgeInsetsRight: CGFloat = 0.0;
    @IBInspectable var edgeInsetsBottom: CGFloat = 0.0
    {
        didSet {
            self.isLayoutMarginsRelativeArrangement = true
            self.layoutMargins.left = edgeInsetsLeft
            self.layoutMargins.top = edgeInsetsTop
            self.layoutMargins.right = edgeInsetsRight
            self.layoutMargins.bottom = edgeInsetsBottom
        }
    }
    
}
