//
//  StepTwoView.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 05.05.2022.
//

import UIKit

class StepTwoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "ViewBackgroundColor")
        setupViews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(buttonNext)
        stackFemale.addArrangedSubview(femaleButton)
        stackFemale.addArrangedSubview(femaleTitle)
        addSubview(stackFemale)
        stackMale.addArrangedSubview(maleButton)
        stackMale.addArrangedSubview(maleTitle)
        addSubview(stackMale)
        stackGender.addArrangedSubview(stackFemale)
        stackGender.addArrangedSubview(stackMale)
        addSubview(stackGender)
    }
    
    func setupConstraint() {
        setupConstraintTitle()
        setupConstraintSubTitle()
        setupConstraintButtonNext()
        setupConstraintStackGender()
    }
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Step 2/5"
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
        subTitle.text = "What is your gender?"
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
    
    let femaleButton: UIButton = {
        let femaleButton = UIButton()
        femaleButton.layer.cornerRadius = 46.0
        femaleButton.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        femaleButton.layer.borderWidth = 1.0
        femaleButton.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        femaleButton.setImage(UIImage(named: "female"), for: .normal)
        femaleButton.accessibilityIdentifier = "female"
        return femaleButton
    }()
    
    let femaleTitle: UILabel = {
        let femaleTitle = UILabel()
        femaleTitle.text = "Female"
        femaleTitle.textColor = UIColor(named: "LabelTextColor")
        femaleTitle.textAlignment = .center
        femaleTitle.font = UIFont(name: "ND Astroneer", size: 24.0)
        return femaleTitle
    }()
    
    let stackFemale: UIStackView = {
        let stackFemale = UIStackView()
        stackFemale.axis = .vertical
        stackFemale.spacing = 29.0
        return stackFemale
    }()
    
    let maleButton: UIButton = {
        let maleButton = UIButton()
        maleButton.layer.cornerRadius = 46.0
        maleButton.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        maleButton.layer.borderWidth = 1.0
        maleButton.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        maleButton.setImage(UIImage(named: "male"), for: .normal)
        maleButton.accessibilityIdentifier = "male"
        return maleButton
    }()
    
    let maleTitle: UILabel = {
        let maleTitle = UILabel()
        maleTitle.text = "Male"
        maleTitle.textColor = UIColor(named: "LabelTextColor")
        maleTitle.textAlignment = .center
        maleTitle.font = UIFont(name: "ND Astroneer", size: 24.0)
        return maleTitle
    }()
    
    let stackMale: UIStackView = {
        let stackMale = UIStackView()
        stackMale.axis = .vertical
        stackMale.spacing = 29.0
        return stackMale
    }()
    
    let stackGender: UIStackView = {
        let stackGender = UIStackView()
        stackGender.axis = .horizontal
        stackGender.distribution = .equalSpacing
        return stackGender
    }()
    
    func setupConstraintStackGender() {
        stackGender.translatesAutoresizingMaskIntoConstraints = false
        femaleButton.heightAnchor.constraint(equalToConstant: 92.0).isActive = true
        femaleButton.widthAnchor.constraint(equalToConstant: 92.0).isActive = true
        maleButton.heightAnchor.constraint(equalToConstant: 92.0).isActive = true
        maleButton.widthAnchor.constraint(equalToConstant: 92.0).isActive = true
        stackGender.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor, constant: 80.0).isActive = true
        stackGender.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 46.0).isActive = true
        stackGender.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -46.0).isActive = true
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
