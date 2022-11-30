//
//  Profile.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 23.04.2022.
//

import UIKit
import Foundation
import RealmSwift

class Profile: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var senderImage: Data?
    var senderIndex: Int?
    
    @IBOutlet weak var photoCollection: UICollectionView!
    let realm = try! Realm()
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    let user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollection.delegate = self
        photoCollection.dataSource = self
        imagePicker.delegate = self
        
        userName.text = user.getUserName()
        if let data = try? Data(contentsOf: user.getUserAvatarUrl()) {
            avatar.image = UIImage(data: data)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realm.objects(Photo.self).count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < realm.objects(Photo.self).count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
            let imageData = realm.objects(Photo.self)[indexPath.row].photoData!
            cell.photo.image = UIImage(data: imageData)
            cell.time.text = realm.objects(Photo.self)[indexPath.row].time
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addPhotoCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "myFooterView", for: indexPath)
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        senderImage = realm.objects(Photo.self)[indexPath.row].photoData
        senderIndex = indexPath.row
        performSegue(withIdentifier: "detailPhotoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPhoto {
            destination.imageData = senderImage
            destination.index = senderIndex
        }
    }
    
    @IBAction func insertNewPhotoAction(_ sender: UIButton) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        let date = DateFormatter()
        date.dateFormat = "HH:mm"
        let dateString = date.string(from: NSDate.now)
        
        let photo = Photo()
        photo.photoData = pickedImage.jpegData(compressionQuality: 0.7)
        photo.time = dateString
        try! realm.write {
            realm.add(photo)
        }
        photoCollection.reloadData()
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signOutAction(_ sender: UIButton) {
        User().signOut()
        performSegue(withIdentifier: "signOutSegue", sender: nil)
    }
    
}
