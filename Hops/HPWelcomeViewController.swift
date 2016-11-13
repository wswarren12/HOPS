//
//  HPWelcomeViewController.swift
//  Hops
//
//  Created by William S. Warren on 11/13/16.
//  Copyright © 2016 William S. Warren. All rights reserved.
//

import UIKit

class HPWelcomeViewController: UIViewController {
    
    var appLabel: UILabel!
    var signUpBtns = [UIButton]()
    
    
    override func loadView() {
        
        let frame = UIScreen.main.bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .blue
        
        let height = frame.size.height
        let width = frame.size.width
        let originX = width*0.5-100
        let w = CGFloat(200)
        let h = CGFloat(50)
        
        
        self.appLabel = UILabel(frame: CGRect(x: originX, y: height*0.20, width: w, height: h))
        self.appLabel.text = "Hops"
        self.appLabel.textAlignment = .center
        self.appLabel.font = UIFont(name: "Arial", size: 24)
        self.appLabel.textColor = .yellow
        view.addSubview(self.appLabel)
        
        var signUpText = ["Login", "SignUp"]
        var y = self.appLabel.frame.size.height + 200
        
        for buttonText in signUpText{
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: originX, y: y, width: w, height: h )
            button.backgroundColor = .red
            button.setTitle(buttonText, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.textColor = .white
            button.addTarget(self, action: #selector(HPWelcomeViewController.showNextScreen(sender:)), for: .touchUpInside)
            
            view.addSubview(button)
            self.signUpBtns.append(button)
            y += 88
        }
        
        
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func showNextScreen (sender: UIButton){
        print("showNextScreen: \(sender.titleLabel?.text)")
        
        if sender.titleLabel?.text == "Login"{
        let loginVc = HPLoginViewController()
        self.navigationController?.pushViewController(loginVc, animated: true)
            
        }
        else {
            let signUpVc = HPSignupViewController()
            self.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}

