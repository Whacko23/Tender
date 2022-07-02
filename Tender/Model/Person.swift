//
//  Person.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/15/22.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imageURLS: [URL]
    var bio: String
}

extension Person {
    static let example = Person(name: "Judy", imageURLS: [URL(string: "https://picsum.photos/id/64/300")!], bio: "Bio")
    static let example2 = Person(name: "Sam", imageURLS: [URL(string: "https://picsum.photos/id/1027/300")!], bio: "Bio")
    static let example3 = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/id/1/300")!], bio: "My bio")
    static let example4 = Person(name: "Matt", imageURLS: [URL(string: "https://picsum.photos/id/1005/300")!], bio: "dog lover")
    static let example5 = Person(name: "Ashley", imageURLS: [URL(string: "https://picsum.photos/id/1011/300")!], bio: "meow")
}
