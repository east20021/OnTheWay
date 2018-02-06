//
//  LogInViewController.swift
//  OnTheWay
//
//  Created by lee on 2018. 2. 1..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var statusBar: UIView!
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    private var themaColor: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setThemaColor()
    }
    
    
    func setThemaColor() {
        themaColor = remoteConfig["splash_background"].stringValue
        
        statusBar.backgroundColor = UIColor(hex: themaColor)
        logInButton.backgroundColor = UIColor(hex: themaColor)
        signUpButton.backgroundColor = UIColor(hex: themaColor)
    }
    
    
    @IBAction func logInButtonAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "에러", message: "이메일이나 비밀번호를 확인해 주세요", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
            
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
                self.present(mainVC, animated: true, completion: nil)
    
            }
        }
    }
    @IBAction func signUpButtonAction(_ sender: Any) {
        let signUpStoryboard = UIStoryboard(name: "SignUp", bundle: nil)
        let signUpVC = signUpStoryboard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpViewController
        self.present(signUpVC, animated: true, completion: nil)
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
