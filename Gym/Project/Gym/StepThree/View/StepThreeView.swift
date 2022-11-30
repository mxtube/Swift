//
//  StepThreeView.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 05.05.2022.
//

import UIKit

class StepThreeView: UIView {
    
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
        insertSubview(backgroundImage, at: 0)
        addSubview(title)
        addSubview(subTitle)
        addSubview(handsButton)
        muscleButtonStack.addArrangedSubview(handsButton)
        muscleButtonStack.addArrangedSubview(spineButton)
        muscleButtonStack.addArrangedSubview(torsoButton)
        muscleButtonStack.addArrangedSubview(legsButton)
        addSubview(muscleButtonStack)
    }
    
    func setupConstraint() {
        setupConstraintTitle()
        setupConstraintSubTitle()
        setupConstraintBackgroundImage()
        setupConstraintStackView()
    }
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        switch Guest.gender {
        case "female":
            image.image = UIImage(named: "woman")
        case "male":
            image.image = UIImage(named: "man")
        default:
            image.image = UIImage(named: "man")
        }
        image.contentMode = .bottom
        return image
    }()
    
    func setupConstraintBackgroundImage() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor, constant: 36.0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40.0).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
    }
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Step 3/5"
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
        subTitle.text = "What do you want to work on?"
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
    
    let handsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hands", for: .normal)
        button.layer.cornerRadius = 23.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 14.0)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    let spineButton: UIButton = {
        let button = UIButton()
        button.setTitle("Spine", for: .normal)
        button.layer.cornerRadius = 23.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 14.0)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    let torsoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Torso", for: .normal)
        button.layer.cornerRadius = 23.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 14.0)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    let legsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Legs", for: .normal)
        button.layer.cornerRadius = 23.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 14.0)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()

    let muscleButtonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 22
        return stackView
    }()
    
    func setupConstraintStackView() {
        muscleButtonStack.translatesAutoresizingMaskIntoConstraints = false
        muscleButtonStack.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 85.0).isActive = true
        muscleButtonStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24.0).isActive = true
        muscleButtonStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -180.0).isActive = true
        muscleButtonStack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.5).isActive = true
    }
    
}
