//
//  Feed.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 21.04.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class Feed: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var feelCollection: UICollectionView!
    @IBOutlet weak var quoteCollection: UICollectionView!
    @IBOutlet weak var profile: UIButton!
    
    let baseUrl = AppDelegate().baseUrl
    var feelingArray: [Feeling] = []
    var quoteArray: [Quoute] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feelCollection.delegate = self
        feelCollection.dataSource = self
        quoteCollection.delegate = self
        quoteCollection.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestFeeling()
        requestQuote()
        
        let name = UserDefaults.standard.value(forKey: "name") ?? "пользователь"
        welcomeLabel.text = "С возвращением, \(name)!"
        let avatar: String = UserDefaults.standard.value(forKey: "avatar") as! String
        print(avatar)
        let url = URL(string: avatar)
        if let data = try? Data(contentsOf: url!) {
            profile.setImage(UIImage(data: data), for: .normal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == quoteCollection {
            return quoteArray.count
        }
        return feelingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == feelCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feelCell", for: indexPath) as! FeelingCell
            let imageUrl = URL(string: feelingArray[indexPath.row].image!)
            let imageData = try? Data(contentsOf: imageUrl!)
            cell.image.image = UIImage(data: imageData!)
            cell.title.text = feelingArray[indexPath.row].title
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quoteCell", for: indexPath) as! QuoteCell
        
        cell.title.text = quoteArray[indexPath.row].title
        cell.content.text = quoteArray[indexPath.row].content
        let imageUrl = URL(string: quoteArray[indexPath.row].image!)
        let imageData = try? Data(contentsOf: imageUrl!)
        cell.image.image = UIImage(data: imageData!)
        
        return cell
    }
    
    private func requestFeeling() {
        AF.request(baseUrl + "/feelings", method: .get).response { response in
            switch response.result {
            case .success(let value):
                self.parseFeeling(data: value!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func parseFeeling(data: Data) {
        let json = JSON(data)
        feelingArray.removeAll()
        for index in 0..<json["data"].count {
            feelingArray.append(
                Feeling(
                    title: json["data"][index]["title"].stringValue,
                    position: json["data"][index]["position"].intValue,
                    image: json["data"][index]["image"].stringValue
                )
            )
        }
        feelingArray.sort { $0.position! < $1.position! }
        feelCollection.reloadData()
    }
    
    private func requestQuote() {
        AF.request(baseUrl + "/quotes", method: .get).response { response in
            switch response.result {
            case .success(let value):
                self.parseQuote(data: value!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func parseQuote(data: Data) {
        let json = JSON(data)
        quoteArray.removeAll()
        for index in 0...json.count {
            quoteArray.append(
                Quoute(
                    title: json["data"][index]["title"].stringValue,
                    content: json["data"][index]["description"].stringValue,
                    image: json["data"][index]["image"].stringValue
                )
            )
        }
        quoteCollection.reloadData()
    }
    
    @IBAction func showUserProfile(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 2
    }
}
