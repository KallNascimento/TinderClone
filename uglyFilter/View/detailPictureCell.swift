//
//  detailPictureCelll.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 26/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class detailPictureCell: UICollectionViewCell{
    let descriptionLabel: UILabel = .textBoldLabel(16)
  let viewControllerSlidePhotos = ViewControllerSlidePhotos()
        
    override init(frame: CGRect){
        super.init(frame: frame)
        
        descriptionLabel.text="Fotos recentes Instagram"
        addSubview(descriptionLabel)
        descriptionLabel.fill(
            top: topAnchor,
            leading:leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top:0, left:20, bottom:0, right:20)
            )
            
        addSubview(viewControllerSlidePhotos.view)
        viewControllerSlidePhotos.view.fill(
            top:descriptionLabel.bottomAnchor,
            leading:leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor
        )
   }
    required init?(coder: NSCoder) {
      fatalError()
    }
    
}
