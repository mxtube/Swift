//
//  SignInView.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 05.05.2022.
//

import UIKit

class SignInView: UIView {
    
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
        addSubview(logo)
        addSubview(title)
        addSubview(login)
        
        loginStack.addArrangedSubview(loginIcon)
        loginStack.addArrangedSubview(borderLoginRight)
        loginStack.addArrangedSubview(login)
        addSubview(loginStack)
        
        passwordStack.addArrangedSubview(passwordIcon)
        passwordStack.addArrangedSubview(borderPasswordRight)
        passwordStack.addArrangedSubview(password)
        addSubview(passwordStack)
        
        addSubview(buttonSignIn)
        addSubview(buttonSignUp)
        addSubview(buttonSkip)
    }
    
    func setupConstraint() {
        setupLogoConstraint()
        setupTitleConstraint()
        setupLoginStackConstraint()
        setupPasswordStackConstraint()
        setupConstraintButtonSignIn()
        setupConstraintButtonSignUp()
        setupConstraintButtonSkip()
    }
    
    let borderLoginRight: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "RoundedWhiteTextFieldBorderColor")
        view.widthAnchor.constraint(equalToConstant: 1.0).isActive = true
        return view
    }()
    
    let borderPasswordRight: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "RoundedWhiteTextFieldBorderColor")
        view.widthAnchor.constraint(equalToConstant: 1.0).isActive = true
        return view
    }()
    
    let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fitnessLogo")
        image.contentMode = .scaleToFill
        return image
    }()
    
    func setupLogoConstraint() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 150.0).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Home\nGym"
        label.numberOfLines = 2
        label.font = UIFont(name: "ND Astroneer", size: 50.0)
        label.textAlignment = .center
        label.textColor = UIColor(named: "LabelTextColor")
        return label
    }()
    
    func setupTitleConstraint() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: -30.0).isActive = true
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
    }
    
    let loginIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "account")
        image.contentMode = .center
        image.setContentHuggingPriority(UILayoutPriority(251.0), for: .horizontal)
        return image
    }()
    
    let login: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: "RoundedWhiteTextFieldTextColor")
        
        textField.attributedPlaceholder = NSAttributedString(string: "Ivanov", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "RoundedWhiteTextFieldPlaceholderColor") ?? UIColor.gray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let loginStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(named: "RoundedWhiteTextFieldBackground")
        stackView.layer.cornerRadius = 25.0
        return stackView
    }()
    
    func setupLoginStackConstraint() {
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        loginIcon.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        loginStack.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 35.0).isActive = true
        loginStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32.0).isActive = true
        loginStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32.0).isActive = true
        loginStack.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    let passwordIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        image.contentMode = .center
        image.setContentHuggingPriority(UILayoutPriority(251.0), for: .horizontal)
        return image
    }()
    
    let password: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: "RoundedWhiteTextFieldTextColor")
        
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "RoundedWhiteTextFieldPlaceholderColor") ?? UIColor.gray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.keyboardType = .emailAddress
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passwordStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(named: "RoundedWhiteTextFieldBackground")
        stackView.layer.cornerRadius = 25.0
        return stackView
    }()
    
    func setupPasswordStackConstraint() {
        passwordStack.translatesAutoresizingMaskIntoConstraints = false
        passwordIcon.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        passwordStack.topAnchor.constraint(equalTo: self.loginStack.bottomAnchor, constant: 15.0).isActive = true
        passwordStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32.0).isActive = true
        passwordStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32.0).isActive = true
        passwordStack.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    let buttonSignIn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25.0
        button.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(named: "RoundedWhiteButtonBorderColor")?.cgColor
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor(named: "RoundedWhiteButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 24.0)
        return button
    }()
    
    func setupConstraintButtonSignIn() {
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSignIn.topAnchor.constraint(equalTo: self.passwordStack.bottomAnchor, constant: 40.0).isActive = true
        buttonSignIn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32.0).isActive = true
        buttonSignIn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32.0).isActive = true
        buttonSignIn.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    let buttonSignUp: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(named: "WhiteTextButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 24.0)
        return button
    }()
    
    func setupConstraintButtonSignUp() {
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        buttonSignUp.topAnchor.constraint(equalTo: self.buttonSignIn.bottomAnchor, constant: 15.0).isActive = true
        buttonSignUp.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32.0).isActive = true
        buttonSignUp.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32.0).isActive = true
        buttonSignUp.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    let buttonSkip: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(named: "WhiteTextButtonTextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "ND Astroneer", size: 16.0)
        return button
    }()
    
    func setupConstraintButtonSkip() {
        buttonSkip.translatesAutoresizingMaskIntoConstraints = false
        buttonSkip.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32.0).isActive = true
        buttonSkip.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32.0).isActive = true
        buttonSkip.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        buttonSkip.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40.0).isActive = true
    }
    
}
