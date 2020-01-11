//
//  C.swift
//  Foodybite
//
//  Created by Usama Sadiq on 1/10/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Custom UIView Class
@IBDesignable class CustomUIView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            Update.topCornersRadius(component: self, radius: self.cornerRadius)
        }
    }
}
@IBDesignable class CustomUIView1: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            Update.allCornerRadius(component: self, radius: self.cornerRadius)
        }
    }
}
@IBDesignable class CustomUILabel: UILabel {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            Update.allCornerRadius(component: self, radius: self.cornerRadius)
        }
    }

}

//MARK: - Custom UIButton Class
@IBDesignable class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 15 {
          didSet {
            Update.allCornerRadius(component: self, radius: self.cornerRadius)
          }
      }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            Update.viewBorderWidth(component: self, width: self.borderWidth)
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.black {
            didSet {
                Update.viewBorderColor(component: self, color: self.borderColor)
            }
        }

}
//MARK: - Custom UIImageView Class
@IBDesignable class Custom_ImageView: UIImageView {

        @IBInspectable var cornerRadius: CGFloat = 15 {
            didSet {
                Update.allCornerRadius(component: self, radius: self.cornerRadius)
            }
        }
    @IBInspectable var borderWidth: CGFloat = 15 {
           didSet {
            Update.viewBorderWidth(component: self, width: self.borderWidth)
        }
       }
    
     @IBInspectable var borderColor: UIColor = UIColor.black {
       didSet {
        Update.viewBorderColor(component: self, color: self.borderColor)
       }
     }
}
//MARK: - Custom UITextField Class

@IBDesignable class CustomTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            Update.allCornerRadius(component: self, radius: self.cornerRadius)
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            Update.viewBorderWidth(component: self, width: self.borderWidth)
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            Update.viewBorderColor(component: self, color: self.borderColor)
        }
    }
    @IBInspectable var IconImage: UIImage? {
        didSet {
           leftViewIcon(component: self, image: self.IconImage)
        }
    }
    @IBInspectable var iconTintColor: UIColor = UIColor.clear {
        didSet {
            leftViewTintColor(component: self, color: self.iconTintColor)
        }
    }
    @IBInspectable var IconPadding: CGFloat = 0
          override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
              var textRect = super.leftViewRect(forBounds: bounds)
              textRect.origin.x += IconPadding
              return textRect
          }
    @IBInspectable var plcHldrColor: UIColor {
        get {
            guard let currentAttributedPlaceholderColor = attributedPlaceholder?.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { return UIColor.clear }
                return currentAttributedPlaceholderColor
            }
            set {
                guard let currentAttributedString = attributedPlaceholder else { return }
                let attributes = [NSAttributedString.Key.foregroundColor : newValue]

                attributedPlaceholder = NSAttributedString(string: currentAttributedString.string, attributes: attributes)
            }
        
    }
     
    
    
    @IBInspectable var text_PadX: CGFloat = 0
    @IBInspectable var text_PadY: CGFloat = 0
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: IconPadding + text_PadX, dy: text_PadY)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    func leftViewIcon(component: UITextField, image: UIImage?) {
             if let image = image {
               component.leftViewMode = UITextField.ViewMode.always
                 let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                 imageView.contentMode = .scaleAspectFit
                 imageView.image = image
                 // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            //    imageView.tintColor = iconTintColor
                 component.leftView = imageView
             } else {
                 component.leftViewMode = UITextField.ViewMode.never
                 component.leftView = nil
             }

         }
       func leftViewTintColor(component: UITextField, color: UIColor){
             // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
           component.leftView?.tintColor = color
       }
}









class Update: UIView {
//MARK: - Corner Radius functions
    // For All Corner Radius
    static func allCornerRadius (component: UIView, radius: CGFloat){
        component.layer.cornerRadius = radius
//        let color = UIColor.black
//        component.layer.shadowColor = color.cgColor
//        component.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    //For top left corner only
    static func topLeftCornerRadius(component: UIView, radius: CGFloat){
            let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.topLeft],cornerRadii: CGSize(width: radius, height:  radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            component.layer.mask = maskLayer
    }
    //For top right conrner only
    static func topRightCornerRadius(component: UIView, radius: CGFloat){
               let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.topRight],cornerRadii: CGSize(width: radius, height:  radius))
               let maskLayer = CAShapeLayer()
               maskLayer.path = path.cgPath
               component.layer.mask = maskLayer
       }
    //For bottom left corner only
    static func bottomLeftCornerRadius(component: UIView, radius: CGFloat){
               let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.bottomLeft],cornerRadii: CGSize(width: radius, height:  radius))
               let maskLayer = CAShapeLayer()
               maskLayer.path = path.cgPath
               component.layer.mask = maskLayer
       }
    //For bottom right corner only
    static func bottomRightCornerRadius(component: UIView, radius: CGFloat){
               let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.topLeft],cornerRadii: CGSize(width: radius, height:  radius))
               let maskLayer = CAShapeLayer()
               maskLayer.path = path.cgPath
               component.layer.mask = maskLayer
       }
    //For top left and right corners
    static func topCornersRadius(component: UIView, radius: CGFloat){
        let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.topLeft, .topRight],cornerRadii: CGSize(width: radius, height:  radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            component.layer.mask = maskLayer
    }
    //For bottom left and right corndres
    static func bottomCornersRadius(component: UIView, radius: CGFloat){
        let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.bottomLeft, .bottomRight],cornerRadii: CGSize(width: radius, height:  radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            component.layer.mask = maskLayer
    }
    //For left top and bottom corners
    static func leftCornersRadius(component: UIView, radius: CGFloat){
        let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.topLeft, .bottomLeft],cornerRadii: CGSize(width: radius, height:  radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            component.layer.mask = maskLayer
    }
    //For right top and bottom corners
    static func rightCornerRadius(component: UIView, radius: CGFloat){
        let path = UIBezierPath(roundedRect: component.bounds,byRoundingCorners:[.topRight, .bottomRight],cornerRadii: CGSize(width: radius, height:  radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            component.layer.mask = maskLayer
    }
//MARK: - UIview Border Color
    static func viewBorderColor(component: UIView, color: UIColor){
        component.layer.borderColor = color.cgColor
       }
//MARK: - UIview Border Width
    static func viewBorderWidth(component: UIView, width: CGFloat){
        component.layer.borderWidth = width
       }
//MARK: - UITextField Left view image
    

}
