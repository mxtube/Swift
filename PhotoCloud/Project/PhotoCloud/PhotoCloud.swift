//
//  PhotoCloud.swift
//  PhotoCloud
//
//  Created by Кирилл Кузнецов on 16.03.2022.
//

import UIKit
import SDWebImage

// Class photo list
class PhotoCloud: UICollectionViewController {
    
    // array for Photo
    var arrayPhoto: [Photo] = []
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    // Function for load data from API
    func loadData() {
        let urlString = "https://jsonplaceholder.typicode.com/photos"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            guard let data = data else { return }
            self.parseJSON(data: data)
        }
        task.resume()
    }
    
    // Function for pasrsing data
    func parseJSON(data: Data) {
        let decoder = JSONDecoder()
        do {
            let photoData = try decoder.decode([Photo].self, from: data)
            for i in 0..<photoData.count {
                arrayPhoto.append(
                    Photo(
                        url: photoData[i].url,
                        title: photoData[i].title
                    ))
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // Function for count row in collection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPhoto.count
    }
    
    // Function for configure collection
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PhotoCell
        cell.picture.sd_setImage(with: URL(string: arrayPhoto[indexPath.row].url))
        cell.detailed.text = arrayPhoto[indexPath.row].title
        return cell
    }
    
    // Function for send image to PhotoDetail
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PhotoDetail else { return }
        let cell = sender as? PhotoCell
        destination.image = cell!.picture.sd_imageURL!.absoluteURL
    }
    
}

