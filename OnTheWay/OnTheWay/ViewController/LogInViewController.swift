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
}
