//
//  MainViewController.swift
//  OnTheWay
//
//  Created by lee on 2018. 2. 6..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signOutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
    
}
