//
//  viewControllerSlidePhotos.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 26/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class ViewControllerSlidePhotos: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    let picbook: [String] = [
        "pessoa-1",
        "pessoa-2",
        "pessoa-3",
        "pessoa-4",
        "pessoa-5",
        "pessoa-6",
        "pessoa-7",
        "pessoa-8",
        "pessoa-9",
        "pessoa-10"
    ]
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("Ferroooou")
    }
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        collectionView.register(slidePhotosCell.self, forCellWithReuseIdentifier: cellId)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.picbook.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath
            ) as! slidePhotosCell
        cell.pictureImageView.image = UIImage(named: self.picbook[indexPath.item])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.height / 2 - 10
        return  .init(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 20, bottom: 0, right: 20)
    }
}
