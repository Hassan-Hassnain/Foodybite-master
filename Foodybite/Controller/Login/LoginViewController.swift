//
//  LoginViewController.swift
//  Foodybite
//
//  Created by Usama Sadiq on 1/4/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    //Short Circuit to requied View
    override func viewWillAppear(_ animated: Bool) {
        performSegue(withIdentifier: K.segueToHomeView, sender: self)
    }
    
    
    
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Try to find next responder
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segueToHomeView, sender: self)
    }
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segueToForgetPassword, sender: self)
    }
    @IBAction func createNewAccountButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segueToCreateNewAccount, sender: self)
    }

}
