//
//  viewControllerSlidePhotos.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 26/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class ViewControllerSlidePhotos: UICollectionViewController {
    let cellId = "cellId"
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("Ferroooou")
    }
    override func viewDidLoad() {
        collectionView.backgroundColor = .purple
        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath
        )
        cell.backgroundColor = .yellow
        return cell
        
    }
}
