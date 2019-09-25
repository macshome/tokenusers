//
//  AppDelegate.swift
//  TokenUsers
//
//  Created by Josh Wisenbaker on 7/8/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Cocoa

let kNotificationName = Notification.Name(rawValue: "tokenuser.Update")

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        registerNotifications()
        printOutput()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func registerNotifications() {
        let noteName =  NSNotification.Name(rawValue: "com.apple.diskmanagement.BooterUpdateFinished")
        DistributedNotificationCenter.default().addObserver(forName: noteName,
                                                            object: nil,
                                                            queue: OperationQueue.main) { _ in self.processNotification()}
    }

    func postNotification() {
        NotificationCenter.default.post(Notification(name: kNotificationName))
    }

    func processNotification() {
        print("Got BooterUpdateFinished notification\n")
        updateUsers()
        postNotification()
        printOutput()
    }

    func printOutput() {
        print("----APFS Token Users----")
        for user in Users.sharedInstance.resolvedUsers {
            print("RecordName: " + user.recordName + "\nUUID: " + user.uuid + "\n")
        }
        print("------------------------")
    }

}

