//
//  Users.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/8/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Foundation


/// Model class to hold resolved crypto users.
class Users {

    /// Singleton for a shared `Users` class.
    static let sharedInstance = Users()

    /// An `Array` of `User` structs representing the APFS cryptousers.
    var resolvedUsers = [User]()

}

/// A resolved user record.
struct User {

    /// The user's `ODRecord` name.
    let recordName: String

    /// The user's `ODRecord` UUID.
    let uuid: String
}
