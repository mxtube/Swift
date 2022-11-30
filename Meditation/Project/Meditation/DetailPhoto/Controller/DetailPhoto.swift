//
//  DetailPhoto.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 23.04.2022.
//

import UIKit
import RealmSwift

class DetailPhoto: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tool: UIStackView!
    
    let realm = try! Realm()
    var imageData: Data?
    var isZoom: Bool = false
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        
        let leftRight = UISwipeGestureRecognizer(target: self, action: #selector(backToProfileAction(_:)))
        leftRight.direction = .right
        
        let rightLeft = UISwipeGestureRecognizer(target: self, action: #selector(deletePhoto(_:)))
        rightLeft.direction = .left
        
        let doubleClick = UITapGestureRecognizer(target: self, action: #selector(zoomImage))
        doubleClick.numberOfTapsRequired = 2
        
        self.view.addGestureRecognizer(rightLeft)
        self.view.addGestureRecognizer(leftRight)
        self.view.addGestureRecognizer(doubleClick)
        
        imageContainer.image = UIImage(data: imageData!)
    }
    
    @IBAction func backToProfileAction(_ sender: Any) {
        guard !isZoom else { return }
        performSegue(withIdentifier: "tabBarSegue", sender: nil)
    }
    
    @IBAction func deletePhoto(_ sender: Any) {
        guard !isZoom else { return }
        try! realm.write {
            realm.delete(realm.objects(Photo.self)[index!])
        }
        performSegue(withIdentifier: "tabBarSegue", sender: nil)
    }

    @objc func zoomImage() {
        isZoom = !isZoom
        if isZoom {
            scroll.zoomScale = 2.0
            tool.isHidden = !tool.isHidden
        } else {
            scroll.zoomScale = 1.0
            tool.isHidden = !tool.isHidden
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageContainer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UITabBarController {
            destination.viewControllers![0].tabBarController?.selectedIndex = 2
        }
    }
}
