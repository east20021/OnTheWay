//
//  SignUpViewController.swift
//  OnTheWay
//
//  Created by lee on 2018. 2. 5..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    private var themaColor: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setThemaColor()
        self.setAddImage()
        try! Auth.auth().signOut()

        // Do any additional setup after loading the view.
    }

    func setThemaColor() {
        themaColor = remoteConfig["splash_background"].stringValue
        
        statusBar.backgroundColor = UIColor(hex: themaColor)
        signUpButton.backgroundColor = UIColor(hex: themaColor)
        cancelButton.backgroundColor = UIColor(hex: themaColor)
    }
    
    func setAddImage() {
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imagePicker)))
    }
    
    @objc func imagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

