//
//  StepFourView.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 06.05.2022.
//

import UIKit

class StepFourView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "ViewBackgroundColor")
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(newbieButton)
        addSubview(keepOnButton)
        addSubview(advancedButton)
        addSubview(buttonNext)
    }
    
    func setupConstraint() {
        setupConstraintTitle()
        setupConstraintSubTitle()
        setupConstraintNewbieButton()
        setupConstraintKeepOnButton()
        setupConstraintAdvancedButton()
        setupConstraintButtonNext()
    }
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Step 4/5"
        title.textAlignment = .center
        title.font = UIFont(name: "ND Astroneer", size: 50.0)
        title.textColor = UIColor(named: "LabelTextColor")
        return title
    }()
    
    func setupConstraintTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 167).isActive = true
    }
    
    let subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.text = "How often do you exercise?"
        subTitle.textAlignment = .center
        subTitle.font = UIFont(name: "ND Astroneer", size: 18.0)
        subTitle.textColor = UIColor(named: "LabelTextColor")
        return subTitle
    }()
    
    func setupConstraintSubTitle() {
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        subTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 43).isActive = true
    }
    
    let newbieButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 38.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        let text: NSString = "Newbie\nJust getting started"
        let split: NSRange = text.range(of: "\n")
    
        var substring1 = ""
        var substring2 = ""
        
        if (split.location != NSNotFound) {
            substring1 = text.substring(to: split.location)
            substring2 = text.substring(from: split.location)
        }
        
        let fontTitle: UIFont = UIFont(name: "ND Astroneer", size: 24.0)!
        let attributes1 = [NSMutableAttributedString.Key.font: fontTitle]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        let fontSubTitle: UIFont = UIFont(name: "ND Astroneer", size: 18.0)!
        let attributes2 = [NSMutableAttributedString.Key.font: fontSubTitle]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
        attrString1.append(attrString2)
        button.setAttributedTitle(attrString1, for: [])
        
        return button
    }()
    
    func setupConstraintNewbieButton () {
        newbieButton.translatesAutoresizingMaskIntoConstraints = false
        newbieButton.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 47.0).isActive = true
        newbieButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.0).isActive = true
        newbieButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.0).isActive = true
        newbieButton.heightAnchor.constraint(equalToConstant: 77.0).isActive = true
    }
    
    let keepOnButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 38.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        let text: NSString = "Keep on\n1-2 times a week"
        let split: NSRange = text.range(of: "\n")
        
        var substring1 = ""
        var substring2 = ""
        
        if (split.location != NSNotFound) {
            substring1 = text.substring(to: split.location)
            substring2 = text.substring(from: split.location)
        }
        
        let fontTitle: UIFont = UIFont(name: "ND Astroneer", size: 24.0)!
        let attributes1 = [NSMutableAttributedString.Key.font: fontTitle]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        let fontSubTitle: UIFont = UIFont(name: "ND Astroneer", size: 18.0)!
        let attributes2 = [NSMutableAttributedString.Key.font: fontSubTitle]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
        attrString1.append(attrString2)
        button.setAttributedTitle(attrString1, for: [])
        
        return button
    }()
    
    func setupConstraintKeepOnButton () {
        keepOnButton.translatesAutoresizingMaskIntoConstraints = false
        keepOnButton.topAnchor.constraint(equalTo: newbieButton.bottomAnchor, constant: 18.0).isActive = true
        keepOnButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.0).isActive = true
        keepOnButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.0).isActive = true
        keepOnButton.heightAnchor.constraint(equalToConstant: 77.0).isActive = true
    }
    
    let advancedButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 38.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        let text: NSString = "Advanced\nMore than 3 times a week"
        let split: NSRange = text.range(of: "\n")
        
        var substring1 = ""
        var substring2 = ""
        
        if (split.location != NSNotFound) {
            substring1 = text.substring(to: split.location)
            substring2 = text.substring(from: split.location)
        }
        
        let fontTitle: UIFont = UIFont(name: "ND Astroneer", size: 24.0)!
        let attributes1 = [NSMutableAttributedString.Key.font: fontTitle]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        let fontSubTitle: UIFont = UIFont(name: "ND Astroneer", size: 18.0)!
        let attributes2 = [NSMutableAttributedString.Key.font: fontSubTitle]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
        attrString1.append(attrString2)
        button.setAttributedTitle(attrString1, for: [])
        
        return button
    }()
    
    func setupConstraintAdvancedButton () {
        advancedButton.translatesAutoresizingMaskIntoConstraints = false
        advancedButton.topAnchor.constraint(equalTo: keepOnButton.bottomAnchor, constant: 18.0).isActive = true
        advancedButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.0).isActive = true
        advancedButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.0).isActive = true
        advancedButton.heightAnchor.constraint(equalToConstant: 77.0).isActive = true
    }
    
    let buttonNext: UIButton = {
        let buttonNext = UIButton()
        buttonNext.layer.cornerRadius = 39.0
        buttonNext.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        buttonNext.layer.borderWidth = 1.0
        buttonNext.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        buttonNext.setTitle("Next", for: .normal)
        buttonNext.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "ND Astroneer", size: 24.0)
        return buttonNext
    }()
    
    func setupConstraintButtonNext() {
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        buttonNext.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 46.0).isActive = true
        buttonNext.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -46.0).isActive = true
        buttonNext.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -91.0).isActive = true
        buttonNext.heightAnchor.constraint(equalToConstant: 77.0).isActive = true
    }
}
