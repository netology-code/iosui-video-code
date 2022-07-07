import Foundation

struct Language {
    let name: String
    let year: String
}

extension Language {
    
    static func make() -> [Language] {
        [
            Language(name: "Assembler", year: "1947"),
            Language(name: "C", year: "1973"),
            Language(name: "C++", year: "1985"),
            Language(name: "Java", year: "1996"),
            Language(name: "Kotlin", year: "2011"),
            Language(name: "PHP", year: "1994"),
            Language(name: "Javascript", year: "1995"),
            Language(name: "Objective-C", year: "1981"),
            Language(name: "Go", year: "2009"),
            Language(name: "Rust", year: "2010"),
            Language(name: "Ruby", year: "1995"),
            Language(name: "Scala", year: "2004"),
            Language(name: "Pascal", year: "1970"),
            Language(name: "Swift", year: "2014"),
            Language(name: "Python", year: "1991"),
            Language(name: "C#", year: "2001"),
            Language(name: "Bash", year: "1989"),
            Language(name: "Typescript", year: "2012"),
            Language(name: "Smalltalk", year: "1980"),
            Language(name: "Dart", year: "2011"),
        ]
    }
}
