//
//  VCCollectionPictures.swift
//  vk_client_test
//
//  Created by admin on 16.08.2022.
//

import UIKit

class ListPicturesController: UICollectionViewController {
    
    var arr_photoes = [UIImage(named: "photo1"),
                       UIImage(named: "photo2"),
                       UIImage(named: "photo3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section > 0 { return 0 }
        return self.arr_photoes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let p = c.viewWithTag(1) as! UIImageView
        p.image = self.arr_photoes[indexPath.row]
        return c
    }
}
