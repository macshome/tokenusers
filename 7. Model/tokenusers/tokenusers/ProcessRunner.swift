//
//  ProcessRunner.swift
//  tokenusers
//
//  Created by Josh Wisenbaker on 7/7/19.
//  Copyright © 2019 Josh Wisenbaker. All rights reserved.
//

import Foundation

struct ProcessRunner {
    
    /// Runs a `Process` command with the calling app's default environment.
    ///
    /// - Parameters:
    ///   - executable: A `String` of a full filesystem path to the executable to run.
    ///   - arguments: An `Array` of `String` values containing the arguments for the command.
    /// - Returns: a `Data` blob containing the output of `standardOutput` and `standardError`
    ///             for the command after it runs.
    /// - Throws: Throws an `Error` if the `Process` fails to run.
    static func shellCommand(_ executable: String, _ arguments: [String]) throws -> Data {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: executable)
        task.arguments = arguments

        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe

        do {
            try task.run()
        } catch {
            throw error
        }

        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return data
    }
}
