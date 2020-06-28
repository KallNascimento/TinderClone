//
//  CombineCardView.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 19/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class CombineCardView: UIView {
    
    var user : User? {
        didSet{
            if let user = user{
                pictureImageView.image = UIImage(named: user.picture)
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                descriptionLabel.text = user.description
            }
        }
    }
    
    let pictureImageView: UIImageView = .pictureImageView()
    
    let nameLabel: UILabel = .textBoldLabel(32, textColor: .white)
    
    let ageLabel: UILabel = .textLabel(28, textColor: .white)
    let descriptionLabel: UILabel = .textLabel(18, textColor: .white, numberOfLines: 2)
    let deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    let likeImageView: UIImageView = .iconCard(named: "card-like")
    var callBack: ((User) -> Void)?
    
    override init(frame:CGRect ){
        super.init(frame: frame)
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nameLabel.addShadow()
        ageLabel.addShadow()
        descriptionLabel.addShadow()
        addSubview(pictureImageView)
        
        addSubview(pictureImageView)
        addSubview(deslikeImageView)
        deslikeImageView.fill(top: topAnchor, leading: nil, trailing: trailingAnchor, bottom: nil,padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        addSubview(likeImageView)
        likeImageView.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        pictureImageView.fillSuperView()
        
        let nameAgeStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel,UIView()])
        nameAgeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nameAgeStackView,descriptionLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        addSubview(stackView)
        
        stackView.fill(
            top: nil,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 16, right: 16)
        )
        
        let tap  = UITapGestureRecognizer(target: self, action:#selector(viewClick))
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tap)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func viewClick (){
        if let user = self.user{
            self.callBack?(user)
        }
    }
}
