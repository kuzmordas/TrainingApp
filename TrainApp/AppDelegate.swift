//
//  AppDelegate.swift
//  TrainApp
//
//  Created by Aleksandr Kuznetsov on 27/04/2020.
//  Copyright © 2020 Aleksandr Kuznetsov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let launch = LaunchController(nibName: "LaunchView", bundle: nil)
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window!.rootViewController = launch
//        window!.makeKeyAndVisible()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
//            let mainView = MainController(nibName: "MainView", bundle: nil)
//            self.window!.rootViewController = mainView
//        })
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

