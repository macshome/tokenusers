import Cocoa
import PlaygroundSupport

let plistURL = URL(fileReferenceLiteralResourceName: "cryptousers.plist")

struct DiskUtilOutput: Codable {
    let Users: [User]
}

struct User: Codable {
    let APFSCryptoUserType: String
    let APFSCryptoUserUUID: String
}

let plistData = try Data(contentsOf: plistURL)
let parsedPlist = try PropertyListDecoder().decode(DiskUtilOutput.self, from: plistData)

func loopFind(_ plist: DiskUtilOutput) -> [String] {
    var uuids = [String]()
    for user in plist.Users {
        if user.APFSCryptoUserType == "LocalOpenDirectory" {
            uuids.append(user.APFSCryptoUserUUID)
        }
    }
    return uuids
}

func functionalFind(_ plist: DiskUtilOutput) -> [String] {
    let uuids = plist.Users.filter { $0.APFSCryptoUserType == "LocalOpenDirectory" }
    return uuids.map { $0.APFSCryptoUserUUID }
}

print(functionalFind(parsedPlist))
print(loopFind(parsedPlist))
