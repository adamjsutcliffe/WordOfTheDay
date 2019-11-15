//
//  ViewController.swift
//  WordOfTheDay
//
//  Created by Adam Sutcliffe on 14/11/2019.
//  Copyright © 2019 Peak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var WordOfTheDayBgView: UIView!
    @IBOutlet weak var WordOfTheDayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        WordOfTheDayBgView.layer.cornerRadius = 10
        WordOfTheDayButton.layer.cornerRadius = 5
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
            (granted, error) in
            if granted {
                print("yes")
            } else {
                print("No")
            }
        }
    }

    @IBAction func cancelToMainViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func TriggerNotificationHandler(_ sender: Any) {
        
        let uniqueId = "meeting-\(UUID().uuidString)"
        let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
              title: "By the fact itself",
              options: UNNotificationActionOptions(rawValue: 0))
        let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
              title: "Fake news",
              options: UNNotificationActionOptions(rawValue: 0))
        // Define the notification type
        let meetingInviteCategory =
              UNNotificationCategory(identifier: uniqueId,
              actions: [acceptAction, declineAction],
              intentIdentifiers: [],
              hiddenPreviewsBodyPlaceholder: "",
              options: .customDismissAction)
        // Register the notification type.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([meetingInviteCategory])
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current

        dateComponents.second = 5  // 5 second delay
        
        
        let content = UNMutableNotificationContent()
        content.title = "Word of the day"
        content.body = "What does 'ipso facto' mean?"
        content.userInfo = ["MEETING_ID" : UUID().uuidString,
                            "USER_ID" : "Adam\(UUID().uuidString)" ]
        content.categoryIdentifier = uniqueId
        
        let trigger = UNCalendarNotificationTrigger(
                 dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
//        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
           if error != nil {
              // Handle any errors.
            print("Got notification errors: \(String(describing: error))")
           }
        }
    }
    
    
}

