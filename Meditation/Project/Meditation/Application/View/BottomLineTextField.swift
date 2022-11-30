//
//  BottomLineTextField.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 21.04.2022.
//

import UIKit

@IBDesignable
class BottomLineTextField: UITextField {
    
    @IBInspectable var bottomLineColor: UIColor = UIColor(named: "TextFieldBottomLineColor") ?? .clear {
        didSet {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: self.frame.height, width: self.frame.size.width - 30, height: 1.0)
            bottomLine.backgroundColor = bottomLineColor.cgColor
            self.layer.addSublayer(bottomLine)
        }
    }
    
    @IBInspectable var colorPlaceholder: UIColor = UIColor(named: "TextFieldPlaceholderColor") ?? .clear {
        didSet{
            self.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            self.attributedPlaceholder = NSAttributedString(
                string: self.placeholder!,
                attributes: [NSAttributedString.Key.foregroundColor: colorPlaceholder]
            )
        }
    }
    
}
