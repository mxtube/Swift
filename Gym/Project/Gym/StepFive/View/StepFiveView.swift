//
//  StepFiveView.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 06.05.2022.
//

import UIKit

class StepFiveView: UIView {

    var nextAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "ViewBackgroundColor")
        setupView()
        setupConstraint()
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(heightTextField)
        addSubview(weightTextField)
        addSubview(buttonNext)
    }
    
    func setupConstraint() {
        setupConstraintTitle()
        setupConstraintSubTitle()
        setupConstraintHeightTextField()
        setupConstraintWeightTextField()
        setupConstraintButtonNext()
    }
    
    func addAction() {
        buttonNext.addTarget(self, action: #selector(nextButtonAction(_:)), for: .touchUpInside)
    }
    
    @objc
    func nextButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            sender.backgroundColor = UIColor(named: "RoundedWhiteButtonActiveBackgroundColor")
        } completion: { _ in
            self.nextAction?()
        }
    }
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Step 5/5"
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
        subTitle.text = "What’s your height and weight?"
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
    
    let heightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "RoundedWhiteTextFieldBackground")
        textField.layer.cornerRadius = 25.0
        textField.font = UIFont(name: "ND Astroneer", size: 24.0)
        textField.textColor = UIColor(named: "RoundedWhiteTextFieldTextColor")
        textField.attributedPlaceholder = NSAttributedString(string: "Height", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "RoundedWhiteTextFieldPlaceholderColor") ?? UIColor.gray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    func setupConstraintHeightTextField() {
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor, constant: 85.0).isActive = true
        heightTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32.0).isActive = true
        heightTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32.0).isActive = true
        heightTextField.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    let weightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "RoundedWhiteTextFieldBackground")
        textField.layer.cornerRadius = 25.0
        textField.font = UIFont(name: "ND Astroneer", size: 24.0)
        textField.textColor = UIColor(named: "RoundedWhiteTextFieldTextColor")
        textField.attributedPlaceholder = NSAttributedString(string: "Weight", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "RoundedWhiteTextFieldPlaceholderColor") ?? UIColor.gray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    func setupConstraintWeightTextField() {
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.topAnchor.constraint(equalTo: self.heightTextField.bottomAnchor, constant: 25.0).isActive = true
        weightTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32.0).isActive = true
        weightTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32.0).isActive = true
        weightTextField.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
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
