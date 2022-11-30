//
//  StepFourController.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 06.05.2022.
//

import UIKit
import CoreData

class StepFourController: UIViewController {

    var stepFourView: StepFourView { return self.view as! StepFourView }
    
    override func loadView() {
        self.view = StepFourView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepFourView.newbieButton.addTarget(self, action: #selector(selectExerciesAction(_:)), for: .touchUpInside)
        stepFourView.keepOnButton.addTarget(self, action: #selector(selectExerciesAction(_:)), for: .touchUpInside)
        stepFourView.advancedButton.addTarget(self, action: #selector(selectExerciesAction(_:)), for: .touchUpInside)
        stepFourView.buttonNext.addTarget(self, action: #selector(nextButtonAction(_:)), for: .touchUpInside)
    }
    
    @objc
    func selectExerciesAction(_ sender: UIButton) {
        stepFourView.newbieButton.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        stepFourView.keepOnButton.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        stepFourView.advancedButton.backgroundColor = UIColor(named: "RoundedWhiteButtonBackground")
        UIView.animate(withDuration: 0.3) {
            sender.backgroundColor = UIColor(named: "RoundedWhiteButtonActiveBackgroundColor")
        } completion: { _ in
            let isSelectedButton = String(sender.attributedTitle(for: .normal)!.string.split(separator: "\n")[0])
            self.saveUserMuscleGroup(with: isSelectedButton)
        }
    }
    
    private func saveUserMuscleGroup(with group: String) {
        Guest.muscle = group
    }
    
    @objc
    func nextButtonAction(_ sender: UIButton) {
        guard Guest.muscle != "" else { return }
        UIView.animate(withDuration: 0.5) {
            sender.backgroundColor = UIColor(named: "RoundedWhiteButtonActiveBackgroundColor")
        } completion: { _ in
            self.showStepFiveAction()
        }
    }
    
    private func showStepFiveAction() {
        let stepFive = StepFiveController()
        stepFive.modalPresentationStyle = .fullScreen
        stepFive.modalTransitionStyle = .coverVertical
        self.present(stepFive, animated: false)
    }
}
