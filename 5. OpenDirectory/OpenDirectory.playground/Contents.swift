import OpenDirectory

struct DSLocalNode {

    enum DSLocalError: Error {
        case noUserFound
    }

    private let localNode: ODNode = {
        return try! ODNode(session: ODSession.default(), type: ODNodeType(kODNodeTypeLocalNodes))
    }()

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
            return records.first!.recordName
        } catch {
            throw error
        }
    }
}

let dsLocal = DSLocalNode()

do {
    let userName = try dsLocal.findUserFor("")
    print(userName)
} catch {
    print(error)
}
