//
//  ViewController.swift
//  SingletonRefactorSample
//
//  Created by Spring Wong on 10/9/2017.
//  Copyright © 2017 Spring Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginButton : UIButton!
    @IBOutlet var debugButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.addTarget(self, action: #selector(btnLoginOnClick), for: .touchUpInside)
        debugButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reset() {
        DataManager.sharedInstance.reset()
        loginButton.isHidden = false
    }

    func btnLoginOnClick() {
        //try to login , if false, we don't want user to login again
        DataManager.sharedInstance.requestCheckLogin {
            self.loginButton.isHidden = DataManager.sharedInstance.isLoggedIn
            if DataManager.sharedInstance.isLoggedIn {
                self.loginButton.isHidden = true
            }else {
                self.loginButton.isHidden = false
                let alertVC = UIAlertController(title: "Login", message: "Login Fail", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    alertVC.dismiss(animated: true, completion: nil)
                })
                alertVC.addAction(cancelAction)
                self.present(alertVC, animated: true)
            }
        }
    }
}

