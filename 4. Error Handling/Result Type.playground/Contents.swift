import Foundation

struct Bomb {
    enum BombError: Error {
        case kaboom
    }

    func shouldExplode(_ goBoom: Bool) -> Result<String, BombError> {
        if goBoom { return .failure(.kaboom)}
        return .success("I'm in one piece!")
    }
}

let aBomb = Bomb()

for bomb in 1...10 {
    let result = aBomb.shouldExplode(Bool.random())
    switch result {
    case .success(let triumph):
        print("Bomb #\(bomb) was a dud! \(triumph)")
    case .failure(let error):
        print("Bomb #\(bomb) exploded! Error: \(error)")
    }
}
