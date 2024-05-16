//
//  EmailTextField.swift
//  coderspace-deneme
//
//  Created by ANIL GULGOR on 6.05.2024.
//

import UIKit

class EmailTextField: UITextField {
      

    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension EmailTextField {
    
    func setEmailTextFieldPlaceholderAppearance(withForegroundColor color:UIColor) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = CGColor(red: 248/255, green: 243/255, blue: 229/255, alpha: 0.5);
        self.layer.cornerRadius = 8;
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]

        self.attributedPlaceholder = NSAttributedString(string: "E-mail adresinizi girin", attributes: placeholderAttributes)
        
    }
    
    func setEmailTextFieldTextAppearance(withTextColor color:UIColor) {
        self.textColor = color;
    }
    
    
}
