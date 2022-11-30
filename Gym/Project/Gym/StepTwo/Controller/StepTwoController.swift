//
//  StepTwoController.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 05.05.2022.
//

import UIKit
import CoreData

class StepTwoController: UIViewController {

    var stepTwoView: StepTwoView { return self.view as! StepTwoView }
    
    override func loadView() {
        self.view = StepTwoView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepTwoView.femaleButton.addTarget(self, action: #selector(self.onSelectGenderAction), for: .touchUpInside)
        stepTwoView.maleButton.addTarget(self, action: #selector(self.onSelectGenderAction), for: .touchUpInside)
        stepTwoView.buttonNext.addTarget(self, action: #selector(self.onNextAction), for: .touchUpInside)
    }
    
    @objc
    func onSelectGenderAction(_ sender: UIButton) {
        stepTwoView.femaleButton.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        stepTwoView.maleButton.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        UIView.animate(withDuration: 0.3) {
            sender.backgroundColor = UIColor(named: "RoundedWhiteButtonActiveBackgroundColor")
        } completion: { _ in
            let isSelectedButton = sender.accessibilityIdentifier!.description
            self.saveGender(withGender: isSelectedButton)
        }
    }
    
    private func saveGender(withGender gender: String) {
        Guest.gender = gender
    }
    
    @objc
    func onNextAction(_ sender: UIButton) {
        guard Guest.gender != "" else { return }
        UIView.animate(withDuration: 0.3) {
            sender.backgroundColor = UIColor(named: "RoundedWhiteButtonActiveBackgroundColor")
        } completion: { _ in
            self.showStepThreeAction()
        }
    }
    
    private func showStepThreeAction() {
        let presentView = StepThreeController()
        presentView.modalPresentationStyle = .fullScreen
        presentView.modalTransitionStyle = .coverVertical
        self.present(presentView, animated: false)
    }
}
