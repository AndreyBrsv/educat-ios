//
//  AppDelegate.swift
//  Educat
//
//  Created by Ilya Mikheev on 12/07/2019.
//  Copyright © 2019 Ilya Mikheev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var context: AppContext!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        context = AppContextImpl(application: application)
        
        window?.rootViewController = context.getRootViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

