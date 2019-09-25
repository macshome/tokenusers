import Foundation

struct Bomb {
    enum BombError: Error {
        case kaboom
    }

    func shouldExplode(_ goBoom: Bool) throws -> String {
        if goBoom { throw BombError.kaboom }
        return "All clear!"
    }
}

let aBomb = Bomb()

try! aBomb.shouldExplode(false)
//try! aBomb.shouldExplode(true)
try? aBomb.shouldExplode(true)
//try aBomb.shouldExplode(true)

do {
    try aBomb.shouldExplode(true)
    print("A dud!")
} catch {
    print(error)
}

for bomb in 1...10 {
    do {
        try aBomb.shouldExplode(Bool.random())
        print("Bomb #\(bomb) was a dud!")
    } catch {
        print("Bomb #\(bomb) exploded!")
    }
}

extension Bomb.BombError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .kaboom:
            return "Unscheduled rapid disassembly"
        }
    }
}

do {
    try aBomb.shouldExplode(true)
    print("A dud!")
} catch {
    print("Caught error: \(error). Description: \(error.localizedDescription)")
}
