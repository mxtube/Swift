//
//  BirthDay.swift
//  BirthDays
//
//  Created by Кирилл Кузнецов on 15.03.2022.
//

import UIKit
import RealmSwift
import Foundation

class BirthDay: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var masterName: UITextField!
    @IBOutlet weak var masterDate: UITextField!
    
    let userDefault = UserDefaults.standard
    let realm = try! Realm()
    let storage = try! Realm().objects(Person.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        masterName.becomeFirstResponder()
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        masterName.text = userDefault.string(forKey: "masterName")
        masterDate.text = userDefault.string(forKey: "masterDate")
    }
    
    @IBAction func saveMasterData(_ sender: UITextField) {
        if sender.accessibilityIdentifier == "masterName" {
            userDefault.set(sender.text, forKey: "masterName")
        } else if sender.accessibilityIdentifier == "masterDate" {
            userDefault.set(sender.text, forKey: "masterDate")
        }
    }
    
    @IBAction func addNewPerson(_ sender: UIButton) {
        guard storage.count <= 10 else { return self.showAlertController(message: "Maximum 10 (ten) person")}
        try! realm.write {
            let person = Person()
            person.name = ""
            person.date = ""
            realm.add(person)
            collection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "personRow", for: indexPath) as! BirthDayCell
        
        cell.name.text = storage[indexPath.row].name
        cell.name.layer.setValue(indexPath, forKey: "indexPath")
        cell.date.text = "\(storage[indexPath.row].date)"
        cell.date.layer.setValue(indexPath, forKey: "indexPath")
        cell.delete.tag = indexPath.row
        
        return cell
    }
    
    @IBAction func editTextFieldInCollection(_ sender: UITextField) {
        let indexPath = sender.layer.value(forKey: "indexPath") as! IndexPath
        let cell = collection!.cellForItem(at: indexPath) as? BirthDayCell
        let name = cell?.name.text!
        let date = cell?.date.text!
        try! realm.write {
            let person = realm.objects(Person.self)
            person[indexPath.row].name = name!
            person[indexPath.row].date = date!
        }
    }
    
    @IBAction func deleteRowInCollection(_ sender: UIButton) {
        try! realm.write {
            let person = realm.objects(Person.self)
            realm.delete(person[sender.tag])
            collection.reloadData()
        }
    }
    
    private func showAlertController(message: String) {
        let alertController = UIAlertController(title: "Notify", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
}

