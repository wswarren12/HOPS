//
//  HPLoginViewController.swift
//  Hops
//
//  Created by William S. Warren on 11/13/16.
//  Copyright © 2016 William S. Warren. All rights reserved.
//

import UIKit

class HPLoginViewController: HPViewController, UITextFieldDelegate {
    

    var loginFields = [UITextField]()
    
    override func loadView() {
        
        let frame = UIScreen.main.bounds
        let view = UIView(frame:frame)
        view.backgroundColor = .darkGray
        
        let width = frame.size.width
        let height = frame.size.height
        
        let loginText = ["Username", "Password"]
        
        var y = height*0.3
        
        for text in loginText {
            let field = UITextField(frame: CGRect(x: width*0.5-100, y: y, width: 200, height: 50))
            field.placeholder = text
            field.delegate = self
            field.backgroundColor = .white
            field.textColor = .black
            
            let isPassword = (text == "Password")
            field.isSecureTextEntry = (isPassword)
            field.returnKeyType = (isPassword) ? .done : .next
            view.addSubview(field)
            
            self.loginFields.append(field)
            y += field.frame.size.height + 40
        }
        
        
        
        
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print ("TextFieldShouldReturn")
        let index = self.loginFields.index(of: textField)!
        
        if index == self.loginFields.count-1 {
            
            var missingValue = ""
            var profileInfo = Dictionary<String, AnyObject>()
            
            for field in self.loginFields {
                if field.text?.characters.count == 0{
                    missingValue = field.placeholder!
                    break
                
                }
                
                print("Missing Value: \(missingValue)")
                profileInfo[field.placeholder!.lowercased()] = field.text! as AnyObject?
            }
            
            if missingValue.characters.count > 0 {
                let msg = "You Forgot Your "+missingValue
                let alert = UIAlertController(title: "Missing Value", message: msg, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            
            }
            
            print("Profile Info: \(profileInfo)")
            return true
        }
        
        let nextField = self.loginFields[index+1]
        nextField.becomeFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    



}
