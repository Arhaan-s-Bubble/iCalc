//
//  LoginViewController.swift
//  iCalc
//
//  Created by Arhaan Khaku on 2024-01-12.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInClicked(_ sender: UIButton) {
        print("clicked")
        guard let email = emailTextField.text else{return}
        guard let password = passwordTextField.text else{return}
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("error!")
            }else{
//                Go to our homescreen
                self.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
