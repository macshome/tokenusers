import Cocoa
import PlaygroundSupport

let plistURL = URL(fileReferenceLiteralResourceName: "cryptousers.plist")

let plistDict = NSDictionary(contentsOf: plistURL)
print(plistDict as Any)

struct DiskUtilOutput: Codable {
    let Users: [User]
}

struct User: Codable {
    let APFSCryptoUserType: String
    let APFSCryptoUserUUID: String
}


let plistData = try Data(contentsOf: plistURL)
let parsedPlist = try PropertyListDecoder().decode(DiskUtilOutput.self, from: plistData)

print(parsedPlist)
print(parsedPlist.Users[1].APFSCryptoUserUUID)
