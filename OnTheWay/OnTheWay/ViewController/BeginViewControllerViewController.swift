//
//  ViewController.swift
//  OnTheWay
//
//  Created by lee on 2018. 2. 1..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import Firebase

class BeginViewController: UIViewController {

    private var remoteConfig: RemoteConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFirebaseRemoteConfig()
        
    }

    func setFirebaseRemoteConfig() {
        //원격 구성 개체 인스턴스를 가져오고 캐시를 빈번하게 고칠 수 있도록 개발자 모드 사용 설정
        remoteConfig = RemoteConfig.remoteConfig()
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.configSettings = remoteConfigSettings!
        
        //plist파일에서 인앱의 기본값 설정
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        //원격 구성 서비스에서 값을 가져오는 fetchWithExpirationDuration:completionHandler: 요청을 만들고 activateFetched를 호출하여 해당 값을 앱에 적용
        remoteConfig.fetch(withExpirationDuration: TimeInterval(0)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            self.displayWelcome()
        }
    }
    
    func displayWelcome() {
        let color = remoteConfig["splash_background"].stringValue
        let caps = remoteConfig["splash_message_caps"].boolValue
        let message = remoteConfig["splash_message"].stringValue
        
        if caps {
            let alert = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: { (action) in
                exit(0)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            setLogInVC()
        }
        self.view.backgroundColor = UIColor(hex: color!)
    }
    
    func setLogInVC() {
        let loginStoryboard = UIStoryboard(name: "LogIn", bundle: nil)
        let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "LogInVC") as! LogInViewController
        self.present(loginVC, animated: true, completion: nil)
    }
}


























