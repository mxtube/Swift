//
//  StepOneController.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 04.05.2022.
//

import UIKit

class StepOneController: UIViewController {
    
    var stepOneView: StepOneView { return self.view as! StepOneView }
    
    override func loadView() {
        self.view = StepOneView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepOneView.weightButton.addTarget(self, action: #selector(self.onButtonAction), for: .touchUpInside)
        stepOneView.keepingButton.addTarget(self, action: #selector(self.onButtonAction), for: .touchUpInside)
        stepOneView.muscleButton.addTarget(self, action: #selector(self.onButtonAction), for: .touchUpInside)
    }
    
    @objc
    func onButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            sender.backgroundColor = UIColor(named: "RoundedWhiteButtonActiveBackgroundColor")
        } completion: { _ in
            let isSelectedButton = sender.titleLabel!.text!
            guard self.savePurpose(withPurpose: isSelectedButton) else { return }
            self.showStepTwoAction()
        }
    }
    
    private func savePurpose(withPurpose purpose: String) -> Bool {
        Guest.purpose = purpose
        guard Guest.purpose != "" else { return false }
        return true
    }
    
    private func showStepTwoAction() {
        let presentedView = StepTwoController()
        presentedView.modalPresentationStyle = .fullScreen
        presentedView.modalTransitionStyle = .coverVertical
        self.present(presentedView, animated: true)
    }
}
