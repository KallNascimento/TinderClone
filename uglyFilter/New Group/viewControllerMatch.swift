//
//  viewControllerMatch.swift
//  uglyFilter
//
//  Created by Kauê Nascimento on 23/06/20.
//  Copyright © 2020 Kauê Nascimento. All rights reserved.
//

import UIKit

class viewControllerMatch: UIViewController, UITextFieldDelegate{
    
    var user: User?{
        didSet{
            if let user = user{
                pictureImageView.image = UIImage(named: user.picture)
                msgLabel.text = "\(user.name)  curtiu você tambem!"
            }
        }
    }
    let pictureImageView: UIImageView = .pictureImageView(named: "pessoa-3")
    let likeImageView :UIImageView = .pictureImageView(named: "icone-like")
    let msgLabel: UILabel = .textBoldLabel(18, textColor: .white, numberOfLines: 1)
    let msgText: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.placeholder = "Meus alunos são tudo fdp"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.textColor = .darkText
        textField.returnKeyType = .go
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
                textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 0))
                textField.rightViewMode = .always
        return textField
        
    }()
    let msgSendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor((UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1)), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
        }()
    let backButton: UIButton = {
           let button = UIButton()
           button.setTitle("Voltar", for: .normal)
           button.setTitleColor((UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)), for: .normal)
           button.titleLabel?.font = .boldSystemFont(ofSize: 16)
           return button
           }()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendMessage()
        return true
    }
    
    @objc func backClick(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func keyboardShow (notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)? .cgRectValue{
            if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double{
                UIView.animate(withDuration: duration){
                    self.view.frame = CGRect(x: UIScreen.main.bounds.origin.x,
                                             y: UIScreen.main.bounds.origin.y,
                                             width: UIScreen.main.bounds.width,
                                             height: UIScreen.main.bounds.height - keyboardSize.height)
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    @objc func keyboardHide(notification: NSNotification){
        if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double{
                     UIView.animate(withDuration: duration){
          
                        self.view.frame = UIScreen.main.bounds
                        self.view.layoutIfNeeded()
                     }
                 }
    }
    @objc func sendMessage(){
        if let msg = self.msgText.text{
          print (msg)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        view.addSubview(pictureImageView)
      
        pictureImageView.fillSuperView()
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor ,UIColor.black.cgColor]
        
        pictureImageView.layer.addSublayer(gradient)
        
        
        msgText.delegate = self
        
        msgLabel.textAlignment = .center
        backButton.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.heightAnchor.constraint(equalToConstant:  44).isActive = true
        likeImageView.contentMode = .scaleAspectFit
        
        msgText.addSubview(msgSendButton)
        msgSendButton.fill(
            top: msgText.topAnchor,
            leading: nil,
            trailing: msgText.trailingAnchor,
            bottom: msgText.bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        msgSendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [likeImageView, msgLabel,msgText,backButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        stackView.fill(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 32, bottom: 46, right: 32))
    }
}
