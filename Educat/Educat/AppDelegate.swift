//
//  AppDelegate.swift
//  Educat
//
//  Created by Ilya Mikheev on 12/07/2019.
//  Copyright © 2019 Ilya Mikheev. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appContext: AppContext = AppContextImpl()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = appContext.getRootViewController()
        
        return true
    }
}

