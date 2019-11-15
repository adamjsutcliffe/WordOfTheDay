//
//  AppDelegate.swift
//  WordOfTheDay
//
//  Created by Adam Sutcliffe on 14/11/2019.
//  Copyright © 2019 Peak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
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

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
               didReceive response: UNNotificationResponse,
               withCompletionHandler completionHandler:
                 @escaping () -> Void) {
               
           // Get the meeting ID from the original notification.
           let userInfo = response.notification.request.content.userInfo
           let meetingID = userInfo["MEETING_ID"] as! String
           let userID = userInfo["USER_ID"] as! String
            print("User info: \(userID) - \(meetingID)")
           // Perform the task associated with the action.
           switch response.actionIdentifier {
           case "ACCEPT_ACTION":
    //          sharedMeetingManager.acceptMeeting(user: userID,
    //                                        meetingID: meetingID)
            print("Accepted action")
              break
                
           case "DECLINE_ACTION":
    //          sharedMeetingManager.declineMeeting(user: userID,
    //                                         meetingID: meetingID)
            print("Declined action")
              break
                
           // Handle other actions…
         
           default:
              break
           }
            
           // Always call the completion handler when done.
           completionHandler()
        }
}

