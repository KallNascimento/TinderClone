//
//  detailHeaderView.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 26/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class detailHeaderView: UICollectionReusableView{
    
    var user: User?{
        didSet{
        if let user = user {
            pictureImageView.image = UIImage(named:user.picture)
        }
    }
}

    var pictureImageView : UIImageView = .pictureImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(pictureImageView)
        pictureImageView.fillSuperView()
    }
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
}
