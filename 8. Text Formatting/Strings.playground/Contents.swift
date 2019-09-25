import Cocoa

let aString = "Swift is "
let truth = "more fun than Python."
print(aString + truth)

let version = 3
print(aString + truth + String(version))

print(aString + truth + " \(version)!")

print(aString + truth.dropLast() + " \(version)!")

let multiline = """

This is a string
    that has some
        strange formatting
            in \(version + 1) lines.
"""
print(multiline)

let cal = """

     July 2019
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31
"""
print(cal)
