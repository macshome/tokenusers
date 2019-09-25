//
//  APFSCryptoUsers.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

/// Property List output of `diskutil apfs listcryptousers / -plist`
struct DiskUtilOutput: Codable {

    /// An `Array` of `CryptoUser` values from the plist.
    let Users: [CryptoUser]
}

/// A `CryptoUser` value containted within `DiskUtilOutput` that describes an APFS crypto user.
struct CryptoUser: Codable {

    /// The type of crypto user reported by `diskutil`
    let APFSCryptoUserType: String

    /// The UUID of the crypto user.
    let APFSCryptoUserUUID: String
}

/// A first-order function that finds the UUIDs of LocalOpenDirectory-type APFS cryptousers
///
/// - Parameter plist: A decoded `DiskUtilOutput` plist
/// - Returns: An `Array` of `String` types of the user UUIDs.
func getCryptoUserUUIDs(_ plist: DiskUtilOutput) -> [String] {
    let uuids = plist.Users.filter { $0.APFSCryptoUserType == "LocalOpenDirectory" }
    return uuids.map { $0.APFSCryptoUserUUID }
}
