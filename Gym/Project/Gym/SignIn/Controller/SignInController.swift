//
//  SignInController.swift
//  Gym
//
//  Created by Кирилл Кузнецов on 05.05.2022.
//

import UIKit
import CoreData

class SignInController: UIViewController {
    
    var stepFiveView: StepFiveView { return self.view as! StepFiveView }
    let userDefault = UserDefaults.standard
    
    override func loadView() {
        self.view = SignInView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefault.setValue(true, forKey: "wasLaunch")
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentConrainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let sortDescriptor =  NSSortDescriptor(key: "purpose", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let data = try context.fetch(fetchRequest)
            guard data.count > 0 else { return }
            print("### User data ###\nPurpose: \(data[0].purpose)\nGender: \(data[0].gender)\nExercise: \(data[0].exercise)\nMuscle: \(data[0].muscle)\nWeight: \(data[0].weight)\nHeight: \(data[0].height)")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
