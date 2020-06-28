//
//  ViewControlerSlidePhotos.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 26/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class slidePhotosCell: UICollectionViewCell{
    var pictureImageView: UIImageView = .pictureImageView()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      
      layer.cornerRadius = 8
      clipsToBounds = true
      
      addSubview(pictureImageView)
      pictureImageView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
      fatalError()
    }
}

