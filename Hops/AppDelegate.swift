//
//  AppDelegate.swift
//  Hops
//
//  Created by William S. Warren on 11/13/16.
//  Copyright © 2016 William S. Warren. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let WelcomeVc = HPWelcomeViewController()
        let navCtr = UINavigationController(rootViewController: WelcomeVc)
        
        self.window?.rootViewController = navCtr
        self.window?.makeKeyAndVisible()
   
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
     
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
     
    }


}

