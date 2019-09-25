//
//  main.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Foundation

let plistData = ProcessRunner.shellCommand("/usr/sbin/diskutil", ["apfs", "listcryptousers", "/", "-plist"])
let users = try PropertyListDecoder().decode(DiskUtilOutput.self, from: plistData)
print(users)
