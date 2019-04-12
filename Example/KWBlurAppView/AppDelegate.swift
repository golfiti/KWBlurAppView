//
//  AppDelegate.swift
//  KWBlurAppView
//
//  Created by Kridsanapong on 11/23/2016.
//  Copyright (c) 2016 Kridsanapong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            KWBlurAppView.sharedInstance.showBlurView()
        }

    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        KWBlurAppView.sharedInstance.showBlurView()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        KWBlurAppView.sharedInstance.hideBlurView()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        KWBlurAppView.sharedInstance.hideBlurView()
    }

    

}

