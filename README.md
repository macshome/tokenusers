# tokenusers
This is the app that we built during my 2019 PSU MacAdmins workshop on development. It is a simple tool that was designed to teach about different areas of Xcode and Swift development.

# In a Nutshell
TokenUsers is a simple app that shows us all of the APFS Secure Token users on a system. On macOS there are a few different tools that show you parts of the info, but not all of it.

`diskutil` will show you the UUID of the users with Secure Tokens. It won't resolve the names.
`sysadminctl` will let you check a name to see if it has a Secure Token, but you need to enter the name, not the UUID.

TokenUsers, and the CLI version `tokenusers` gives you a simple list of the users by both name and UUID. It's like peanut butter and chocolate, but with cryptographic tokens and user names.

Here is what the CLI output looks like:
![]()

Here is the GUI app:
![]()

# Concepts You Might Accidently Learn
If you start at the begining of the folders we first build the CLI app and transition to the GUI version. There are Swift Playgrounds in each step as well that you can use to get a feel for each API that we use along the way. Each step builds upon the last.

If we were to look at the order in which you are exposed to concepts it looks like this...

1. How to open a project in Xcode and build it.
2. Running a tool with `Process`, `URL`, and `Pipe` APIs. Also Xcode header doc generation.
3. Parsing plist content with `PropertyListDecoder` and `Codable`.
4. Swift Error handling with `throws`, different styles of `try`, and a peek at the `Result` type.
5. Searching for users with the `OpenDirectory` API and custom `Error` types.
6. Parsing data with `map` and `for...in` techniques.
7. How to seperate data to a Model class and when either `class` or `struct` is appropriate.
8. Basics of Swift text formatting and interlopation.
9. Using archiving in Xcode to make a distribution build.
10. Adding a new target in Xcode and sharing code between your CLI and GUI apps. Also that whole GUI version thing.
