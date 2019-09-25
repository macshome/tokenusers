//
//  main.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Foundation

do {
    let plistData = try ProcessRunner.shellCommand("/usr/sbin/diskutil", ["apfs", "listcryptousers", "/", "-plist"])
    let decodedPlist = try PropertyListDecoder().decode(DiskUtilOutput.self, from: plistData)
    let userUUIDs = getCryptoUserUUIDs(decodedPlist)
    print(userUUIDs)
} catch {
    print(error)
}

