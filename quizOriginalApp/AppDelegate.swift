//
//  AppDelegate.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/02/22.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

import NCMB



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        StoryboardHelper.adjust(to: window)
        
        // NCMBとアプリと紐付ける
        NCMB.setApplicationKey("9ce604eb256cd9c70cfa05ec3170418e2b3ac764713cfc05ed4e0f7760c11375", clientKey: "f416358d67bf454200306288a68f3dbccedd254e2cf5d701ffeed98e3d1c5d8f")
        
        UINavigationBar.appearance().tintColor = UIColor.init(red: 254/255, green: 250/255, blue: 251/255, alpha: 1.0)
        
        UINavigationBar.appearance().barTintColor = UIColor.init(red: 255/255, green: 75/255, blue: 96/255, alpha: 0.2)
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.init(red: 254/255, green: 250/255, blue: 251/255, alpha: 1.0)]
        
        UITabBar.appearance().tintColor = UIColor.init(red: 254/255, green: 250/255, blue: 251/255, alpha: 1.0)
        
        //UITabBarItem.appearance().setTitleTextAttributes(<#T##attributes: [String : Any]?##[String : Any]?#>, for: UIControlState.selected)
        
        UITabBar.appearance().barTintColor = UIColor.init(red: 255/255, green: 75/255, blue: 96/255, alpha: 0.2)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

