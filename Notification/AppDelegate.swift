//
//  AppDelegate.swift
//  Notification
//
//  Created by Yasmin Ayman on 07/10/1440 AH.
//  Copyright © 1440 yasmin.ayman. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func athanNotification() {
        // authontication
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert , .badge , .sound]) { (result, error) in
            // handle result
        }
        
        // notification content
        let athanContent = UNMutableNotificationContent.init()
        athanContent.title = "Pray time! ^_^"
        athanContent.body = "This is a local notifcation to inform you that it is the athan time now in your city !"
        athanContent.sound = UNNotificationSound.default
        
        // trigger
        var dateComponents = DateComponents()
       
        //just for testing ^^!
        dateComponents.calendar = Calendar.current
        dateComponents.hour = 6
        dateComponents.minute = 0
        
        let athanTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents , repeats: true)
        
        // request
        let athanUUID = UUID().uuidString
        let request = UNNotificationRequest(identifier: athanUUID, content: athanContent, trigger: athanTrigger)

        center.add(request) { (error) in
            print("error \(error?.localizedDescription)")
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        athanNotification()
       
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

