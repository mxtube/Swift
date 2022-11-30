//
//  StepFiveController.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 06.05.2022.
//

import UIKit
import CoreData

class StepFiveController: UIViewController {
    
    var stepFiveView: StepFiveView { return self.view as! StepFiveView }
    let user = User.self
    
    override func loadView() {
        self.view = StepFiveView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        stepFiveView.heightTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepFiveView.heightTextField.addTarget(self, action: #selector(editHeightAction(_:)), for: .editingChanged)
        stepFiveView.weightTextField.addTarget(self, action: #selector(editWeightAction(_:)), for: .editingChanged)
        stepFiveView.buttonNext.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        let tapOnScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapOnScreen)
    }
    
    @objc
    func hideKeyboard() {
        stepFiveView.heightTextField.resignFirstResponder()
        stepFiveView.weightTextField.resignFirstResponder()
    }
    
    @objc
    func editHeightAction(_ sender: UITextField) {
        let textFieldValue = sender.text
        guard let number = NumberFormatter().number(from: textFieldValue ?? "") else { return }
        Guest.height = Double(number)
    }
    
    @objc
    func editWeightAction(_ sender: UITextField) {
        let textFieldValue = sender.text
        guard let number = NumberFormatter().number(from: textFieldValue ?? "") else { return }
        Guest.weight = Double(number)
    }
    
    private func saveUserData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentConrainer.viewContext
        let user = Guest.self
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else { return }
        
        let userObject = User(entity: entity, insertInto: context)
        userObject.purpose = user.purpose
        userObject.gender = user.gender
        userObject.exercise = user.exercise
        userObject.muscle = user.muscle
        userObject.height = user.height
        userObject.weight = user.weight
        do {
            try context.save()
            showSignInAction()
        } catch let error as NSError {
            self.alertController(with: error.localizedDescription)
        }
    }
    
    @objc
    func nextAction() {
        let height = stepFiveView.heightTextField.text!
        let weight = stepFiveView.weightTextField.text!
        guard !height.isEmpty && !weight.isEmpty else { return alertController(with: "Empty data")}
        self.saveUserData()
    }
    
    private func showSignInAction() {
        let signIn = SignInController()
        signIn.modalPresentationStyle = .fullScreen
        signIn.modalTransitionStyle = .coverVertical
        present(signIn, animated: false)
    }
    
    func alertController(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}
