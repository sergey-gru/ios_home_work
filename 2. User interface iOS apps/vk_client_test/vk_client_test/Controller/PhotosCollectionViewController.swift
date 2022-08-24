//
//  VCCollectionPictures.swift
//  vk_client_test
//
//  Created by admin on 16.08.2022.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    var photos = [UIImage(named: "photo1"),
                   UIImage(named: "photo2"),
                   UIImage(named: "photo3")]
    
    func SetPhotos(_ photos: [String]) {
        var arr = [UIImage]()
        
        for ph in photos {
            let img = UIImage(named: ph) ?? UIImage(systemName: "person.fill.viewfinder")!
            arr.append(img)
        }
        
        self.photos = arr
    }
    
    var photosImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section > 0 { return 0 }
        return self.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        let p = c.photoImageView!
        p.image = self.photos[indexPath.row]
        return c
    }
    
}
