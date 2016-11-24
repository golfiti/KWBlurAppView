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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func applicationWillResignActive(application: UIApplication) {
        
        let seconds = 0.2
        let delay = seconds * Double(NSEC_PER_SEC)
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            KWBlurAppView.sharedInstance.showBlurView()
        })
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        KWBlurAppView.sharedInstance.showBlurView()
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        KWBlurAppView.sharedInstance.hideBlurView()
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        KWBlurAppView.sharedInstance.hideBlurView()
    }

    

}

