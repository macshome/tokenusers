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
    print(users.resolvedUsers)
} catch {
    print(error.localizedDescription)
}

