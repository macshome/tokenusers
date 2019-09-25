import Cocoa

struct ValueTypes: Equatable {
    var foo: String
    var bar: String
}

class ReferenceTypes {
    var foo = ""
    var bar = ""

    init(foo: String, bar: String) {
        self.foo = foo
        self.bar = bar
    }
}

var aStruct = ValueTypes(foo: "apple", bar: "orange")
let aClass = ReferenceTypes(foo: "apple", bar: "orange")

func printA() {
    print("aStruct has a: \(aStruct.foo) \(aStruct.bar)")
    print("aClass has a: \(aClass.foo) \(aClass.bar)")
    print("")
}

printA()

var bStruct = aStruct
bStruct.foo = "Pineapple"
bStruct.bar = "Pen"

let bClass = aClass
bClass.foo = "Pineapple"
bClass.bar = "Pen"

func printB() {
    print("bStruct has a: \(bStruct.foo) \(bStruct.bar)")
    print("bClass has a: \(bClass.foo) \(bClass.bar)")
    print("")
}

printB()
printA()

aStruct == bStruct ? true : false

aClass === bClass ? true : false
print("aClass pointer: ", ObjectIdentifier(aClass))
print("bClass pointer: ", ObjectIdentifier(bClass))
