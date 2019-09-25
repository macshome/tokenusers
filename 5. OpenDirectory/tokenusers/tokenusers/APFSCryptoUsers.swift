//
//  APFSCryptoUsers.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

/// Property List output of `diskutil apfs listcryptousers / -plist`
struct DiskUtilOutput: Codable {

    /// An `Array` of `User` values from the plist.
    let Users: [User]
}

/// A `User` value containted within `DiskUtilOutput` that describes an APFS crypto user.
struct User: Codable {

    /// The type of crypto user reported by `diskutil`
    let APFSCryptoUserType: String

    /// The UUID of the crypto user.
    let APFSCryptoUserUUID: String
}
