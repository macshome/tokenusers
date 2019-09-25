//
//  DSLocal.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import OpenDirectory

struct DSLocal {

    /// Error messages to cover common cases not covered by the `ODErrorDomain`
    ///
    /// - noUserFound: Could not find a matching user.
    enum DSLocalError: Error {
        case noUserFound
    }

    private let localNode: ODNode = {
        return try! ODNode(session: ODSession.default(), type: ODNodeType(kODNodeTypeLocalNodes))
    }()

    /// Find the `recordName` of a local user that matches the given uuid `String`
    ///
    /// - Parameter uuid: A `String` representing a uuid to search for in the local OD Node.
    /// - Returns: The located username as a `String`
    /// - Throws: Either an `ODErrorDomain` or a `DSLocalError` depending on where the failure occured.
    func findUserFor(_ uuid: String) throws -> String {
        do {
            let query = try ODQuery(node: localNode,
                                    forRecordTypes: kODRecordTypeUsers,
                                    attribute: kODAttributeTypeGUID,
                                    matchType: ODMatchType(kODMatchEqualTo),
                                    queryValues: uuid,
                                    returnAttributes: kODAttributeTypeNativeOnly,
                                    maximumResults: 1)
            let records = try query.resultsAllowingPartial(false) as! [ODRecord]
            if records.isEmpty { throw DSLocalError.noUserFound }
            return records.first?.recordName ?? "noUserFound"
        } catch {
            throw error
        }
    }
}
