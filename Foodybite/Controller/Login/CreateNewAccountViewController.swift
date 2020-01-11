//
//  CreateNewAccountViewController.swift
//  Foodybite
//
//  Created by Usama Sadiq on 1/5/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class CreateNewAccountViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileImageIcon: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        //addLeftIconImage()
    }
        
    @IBAction func profileImageUploadButton(_ sender: UIButton) {
    }
    @IBAction func registerButton(_ sender: UIButton) {
    }
    @IBAction func haveAccountLoginButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
    
//    func addLeftIconImage(){
//        if let imgName = UIImage(named: K.nameTextFieldIcon),
//            let imgEmail = UIImage(named: K.emailTextFieldIcon),
//            let imgPassword = UIImage(named: K.passwordTextFieldIcon){
//
//            UIViewTouchUp.addleftImageTo(txtField: nameTextField, andImage: imgName)
//            UIViewTouchUp.addleftImageTo(txtField: emailTextField, andImage: imgEmail)
//            UIViewTouchUp.addleftImageTo(txtField: passwordTextField, andImage: imgPassword)
//            UIViewTouchUp.addleftImageTo(txtField: confirmPasswordTextField, andImage: imgPassword)
//        }
//    }
    
}
