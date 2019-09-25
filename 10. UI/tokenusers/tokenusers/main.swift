//
//  main.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Foundation

let dslocal = DSLocal()
let users = Users.sharedInstance

func printOutput() {
    print("----APFS Token Users----")
    _ = users.resolvedUsers.map { print("RecordName: " + $0.recordName + "\nUUID: " + $0.uuid + "\n") }
    print("------------------------")
}

do {
    let plistData = try ProcessRunner.shellCommand("/usr/sbin/diskutil", ["apfs", "listcryptousers", "/", "-plist"])
    let decodedPlist = try PropertyListDecoder().decode(DiskUtilOutput.self, from: plistData)
    let userUUIDs = getCryptoUserUUIDs(decodedPlist)
    for uuid in userUUIDs {
        if let recordName = try? dslocal.findUserFor(uuid) {
        let newUser = User(recordName: recordName, uuid: uuid)
        users.resolvedUsers.append(newUser)
        }
    }
printOutput()
} catch {
    print(error.localizedDescription)
}


