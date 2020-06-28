//
//  loadingView.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 23/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit
class loadingView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loadView)
        
        loadView.center = center
        addSubview(profileImageView)
        profileImageView.center = center
        
        self.animateLoad()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not be implemented")
    }
    
    
    func animateLoad(){
        UIView.animate(withDuration: 1.3, animations: {
            self.loadView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            self.loadView.center = self.center
            self.loadView.layer.cornerRadius = 125
            self.loadView.alpha = 0.3
        }){(_) in
            self.loadView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.loadView.center = self.center
            self.loadView.layer.cornerRadius = 50
            self.loadView.alpha = 1
            self.animateLoad()
            
        }
    }
    
    
    let loadView: UIView = {
           let load = UIView()
           load.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
           load.backgroundColor = UIColor(red: 218/255, green: 99/255, blue: 111/255, alpha: 1)
           load.layer.cornerRadius = 50
           load.layer.borderWidth = 1
           load.layer.borderColor = UIColor.red.cgColor
           return load
       }()
       
       let profileImageView: UIImageView = {
            
                let userPicture = UIImageView()
                userPicture.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                userPicture.layer.cornerRadius = 50
                userPicture.layer.borderWidth = 5
                userPicture.layer.borderColor = UIColor.white.cgColor
                userPicture.clipsToBounds = true
                userPicture.image = UIImage(named: "perfil")
                return userPicture
                
            }()
       
}
