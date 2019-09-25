//
//  main.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Foundation

let result = ProcessRunner.shellCommand("/usr/sbin/diskutil", ["apfs", "listcryptousers", "/"])
if let output = String(data: result, encoding: .utf8) {
    print(output)
} else {
    print("Something bad happened!")
}
