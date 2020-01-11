//
//  ViewController.swift
//  Foodybite
//
//  Created by Usama Sadiq on 1/3/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
        
    @IBOutlet weak var bgHome: UIImageView!
    @IBOutlet weak var appTitle: UIImageView!
    var finalFram = CGRect()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        prepareBackgroundLogoAnimation()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        backgroundLogoAnimation()
        
    }
  
}
//MARK: - Animations
extension EntryViewController {
    func  backgroundLogoAnimation() {
       
        UIView.animate(withDuration: 1.5, animations: {

            self.bgHome.transform = CGAffineTransform(scaleX: 1.118, y: 1.118)
            let radians = 17 / 180.0 * CGFloat.pi
            let rotation = self.bgHome.transform.rotated(by: radians);
            self.bgHome.transform = rotation
            
        }) { (finnished) in
            self.appTitle.frame = CGRect(x: -100, y: 415.5 * 1.5, width: self.finalFram.width * 4 , height: self.finalFram.height * 4)
            
            UIView.animate(withDuration: 0.75, delay: 0.0, animations:  {
                self.appTitle.alpha = 1.0
                self.appTitle.frame = self.finalFram
            }){ (finnished) in
                UIView.animate(withDuration: 2.0, delay: 6.0, animations: {
                    self.performSegue(withIdentifier: K.segueToLoginView, sender: self)
                }, completion: nil)
            }
        }
        
        
        
    }
    func prepareBackgroundLogoAnimation(){
        finalFram = appTitle.frame
        appTitle.alpha = 0.0
    }
    
    
    
    
    
    
}


