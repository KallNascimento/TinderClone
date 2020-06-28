//
//  detailProfileCell.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 26/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class detailProfileCell : UICollectionViewCell{
    var user: User?{
        didSet{
            if let user = user {
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                descriptionLabel.text = user.description
            }
        }
    }
    
    let nameLabel: UILabel = .textBoldLabel(32)
    let ageLabel: UILabel = .textLabel(28)
    let descriptionLabel: UILabel = .textLabel(18, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let nameAgeStackView = UIStackView(arrangedSubviews: [nameLabel,ageLabel,UIView()])
        nameAgeStackView.spacing = 12
        let stackView = UIStackView(arrangedSubviews: [nameAgeStackView,descriptionLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fillSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
