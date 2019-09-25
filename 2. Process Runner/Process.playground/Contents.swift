import Foundation


URL(fileURLWithPath: "/Users/ Shared")

func shellCommand(_ executable: String, _ arguments: [String]) -> Data {
    let task = Process()
    task.executableURL = URL(fileURLWithPath: executable)
    task.arguments = arguments

    let pipe = Pipe()
    task.standardOutput = pipe
    task.standardError = pipe

    try! task.run()

    task.waitUntilExit()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    return data
}



let result = shellCommand("/usr/sbin/diskutil", ["apfs", "listcryptousers", "/", "-plist"])

print(String(data: result, encoding: .utf8))

