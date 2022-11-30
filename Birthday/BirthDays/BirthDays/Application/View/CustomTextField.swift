//
//  CustomTextField.swift
//  BirthDays
//
//  Created by Кирилл Кузнецов on 30.03.2022.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var placeHolderColor: UIColor = UIColor(named: "Gray")! {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder?.string ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeHolderColor])
        }
    }
}
