//
//  Person.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/15/22.
//

import Foundation

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    var age: Int
}

extension Person {
    static let example = Person(
        name: "Judy",
        imageURLS: [
            URL(string: "https://picsum.photos/id/64/300")!,
            URL(string: "https://picsum.photos/301")!,
            URL(string: "https://picsum.photos/302")!,
            URL(string: "https://picsum.photos/303")!,
            URL(string: "https://picsum.photos/304")!],
        bio: "Here for a good time, not a long time 😜",
        age: 21)
    
    static let example1 = Person(
        name: "Judy",
        imageURLS: [
            URL(string: "https://picsum.photos/305")!,
            URL(string: "https://picsum.photos/306")!,
            URL(string: "https://picsum.photos/307")!,
            URL(string: "https://picsum.photos/308")!,
            URL(string: "https://picsum.photos/309")!],
        bio: "Bio",
        age: 21)
    
    static let example2 = Person(name: "Sam", imageURLS: [URL(string: "https://picsum.photos/id/1027/300")!], bio: "Bio", age: 26)
    static let example3 = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/id/1/300")!], bio: "My bio", age: 32)
    static let example4 = Person(name: "Matt", imageURLS: [URL(string: "https://picsum.photos/id/1005/300")!], bio: "dog lover", age: 35)
    static let example5 = Person(name: "Ashley", imageURLS: [URL(string: "https://picsum.photos/id/1011/300")!], bio: "meow", age: 26)
    static let example6 = Person(name: "Kira", imageURLS: [URL(string: "https://picsum.photos/800")!], bio: "meow", age: 43)
}
