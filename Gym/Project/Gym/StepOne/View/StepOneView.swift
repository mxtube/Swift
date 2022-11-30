//
//  StepOneView.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 04.05.2022.
//
import UIKit

class StepOneView: UIView {
    
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
        addSubview(weightButton)
        addSubview(keepingButton)
        addSubview(muscleButton)
    }
    
    func setupConstraint() {
        setupConstraintTitle()
        setupConstraintSubTitle()
        setupConstraintWeightButton()
        setupConstraintKeepingButton()
        setupConstraintMuscleButton()
    }
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Step 1/5"
        title.textAlignment = .center
        title.font = UIFont(name: "ND Astroneer", size: 50.0)
        title.textColor = UIColor(named: "LabelTextColor")
        return title
    }()
    
    func setupConstraintTitle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 167).isActive = true
    }
    
    let subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.text = "What is your purpose?"
        subTitle.textAlignment = .center
        subTitle.font = UIFont(name: "ND Astroneer", size: 18.0)
        subTitle.textColor = UIColor(named: "LabelTextColor")
        return subTitle
    }()
    
    func setupConstraintSubTitle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        subTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 43).isActive = true
    }
    
    let weightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Weight loss", for: .normal)
        button.layer.cornerRadius = 39.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 24.0)
        button.setImage(UIImage(named: "Scale"), for: .normal)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 28)
        return button
    }()
    
    func setupConstraintWeightButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        weightButton.translatesAutoresizingMaskIntoConstraints = false
        weightButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45).isActive = true
        weightButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45).isActive = true
        weightButton.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor, constant: 82).isActive = true
        weightButton.heightAnchor.constraint(equalToConstant: 77.0).isActive = true
    }
    
    let keepingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Keeping fit", for: .normal)
        button.layer.cornerRadius = 39.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 24.0)
        button.setImage(UIImage(named: "Yoga"), for: .normal)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 28)
        return button
    }()
    
    func setupConstraintKeepingButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        keepingButton.translatesAutoresizingMaskIntoConstraints = false
        keepingButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45).isActive = true
        keepingButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45).isActive = true
        keepingButton.topAnchor.constraint(equalTo: self.weightButton.bottomAnchor, constant: 29).isActive = true
        keepingButton.heightAnchor.constraint(equalToConstant: 77.0).isActive = true
    }
    
    var muscleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Build muscle", for: .normal)
        button.layer.cornerRadius = 39.0
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 24.0)
        button.setImage(UIImage(named: "Triceps"), for: .normal)
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 28)
        return button
    }()
    
    func setupConstraintMuscleButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        muscleButton.translatesAutoresizingMaskIntoConstraints = false
        muscleButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45).isActive = true
        muscleButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45).isActive = true
        muscleButton.topAnchor.constraint(equalTo: self.keepingButton.bottomAnchor, constant: 29).isActive = true
        muscleButton.heightAnchor.constraint(equalToConstant: 77.0).isActive = true
    }
}
