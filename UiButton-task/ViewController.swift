//
//  ViewController.swift
//  UiButton-task
//
//  Created by Abdullah Bin Essa on 2/28/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let userImage = UIImageView()
    let imageNameTextField = UITextField()
    let myButton = UIButton(type: .system)
    
    var selectedImage = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupUI()
        setupConstraints()
        changeImageButton()
        
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(userImage)
        view.addSubview(imageNameTextField)
        view.addSubview(myButton)
    }
    
    func setupUI(){
        imageNameTextField.placeholder = "Enter image name here"
        imageNameTextField.textAlignment = .center
        
        myButton.setTitle("Load image", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.layer.cornerRadius = 8
        
        userImage.image = UIImage(named: selectedImage )
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.lightGray.cgColor
        userImage.layer.cornerRadius = userImage.frame.height / 2
        
        myButton.addTarget(self, action: #selector(changeImageButton), for: .touchUpInside)
        myButton.layer.shadowColor = UIColor.black.cgColor
        myButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        myButton.layer.shadowOpacity = 0.5
        myButton.layer.shadowRadius = 4

    }
    
    func setupConstraints(){
        myButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
                make.width.equalTo(100)
                make.height.equalTo(50)
        }
        
        imageNameTextField.snp.makeConstraints { make in
            make.bottom.equalTo(myButton.snp.top).offset(-10)
                make.centerX.equalToSuperview()
                make.width.equalTo(200)
        }
        
        userImage.snp.makeConstraints { make in
            make.bottom.equalTo(imageNameTextField.snp.bottom).offset(-40)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        
        
    }
    
    @objc func changeImageButton(){
        selectedImage = imageNameTextField.text!
        userImage.image = UIImage(named: selectedImage)
    }


}

