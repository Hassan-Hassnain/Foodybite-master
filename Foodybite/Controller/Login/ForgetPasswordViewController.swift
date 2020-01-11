//
//  ForgetPasswordViewController.swift
//  Foodybite
//
//  Created by Usama Sadiq on 1/5/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        //if let emailImage = UIImage(named: K.emailTextFieldIcon){
        //UIViewTouchUp.addleftImageTo(txtField: emailTextField, andImage: emailImage)
        //}
    }
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segueBackToLoginView, sender: self)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segueBackToLoginView, sender: self)
    }
    
    
}
