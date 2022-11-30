//
//  StepThreeController.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 05.05.2022.
//

import UIKit
import CoreData

class StepThreeController: UIViewController {
    
    var stepThreeView: StepThreeView { return self.view as! StepThreeView }
    
    override func loadView() {
        self.view = StepThreeView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepThreeView.handsButton.addTarget(self, action: #selector(selectedMuscleGroup(_:)), for: .touchUpInside)
        stepThreeView.spineButton.addTarget(self, action: #selector(selectedMuscleGroup(_:)), for: .touchUpInside)
        stepThreeView.torsoButton.addTarget(self, action: #selector(selectedMuscleGroup(_:)), for: .touchUpInside)
        stepThreeView.legsButton.addTarget(self, action: #selector(selectedMuscleGroup(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stepThreeView.backgroundImage.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        stepThreeView.backgroundImage.frame.origin.x += stepThreeView.backgroundImage.frame.size.width
        UIView.animate(withDuration: 1.5, delay: 0.0) {
            self.stepThreeView.backgroundImage.alpha = 1.0
            self.stepThreeView.backgroundImage.frame.origin.x -= self.stepThreeView.backgroundImage.frame.size.width
        }
    }
    
    @objc
    func selectedMuscleGroup(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            sender.backgroundColor = UIColor(named: "RoundedWhiteButtonActiveBackgroundColor")
        } completion: { _ in
            let isSelectedButton = sender.titleLabel!.text!
            guard self.saveExercise(withExercise: isSelectedButton) else { return }
            self.showStepFourAction()
        }
    }
    
    private func saveExercise(withExercise exercise: String) -> Bool {
        Guest.exercise = exercise
        guard Guest.exercise != "" else { return false }
        return true
    }
    
    private func showStepFourAction() {
        let stepFour = StepFourController()
        stepFour.modalPresentationStyle = .fullScreen
        stepFour.modalTransitionStyle = .coverVertical
        self.present(stepFour, animated: false)
    }
}
