//
//  SignUpViewController.swift
//  OnTheWay
//
//  Created by lee on 2018. 2. 5..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    private var themaColor: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setThemaColor()

        // Do any additional setup after loading the view.
    }

    func setThemaColor() {
        themaColor = remoteConfig["splash_background"].stringValue
        
        statusBar.backgroundColor = UIColor(hex: themaColor)
        signUpButton.backgroundColor = UIColor(hex: themaColor)
        cancelButton.backgroundColor = UIColor(hex: themaColor)
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

