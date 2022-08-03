//
//  Person.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/15/22.
//

import SwiftUI

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    var distance: Int
    var age: Int
    
    var bioLong: String
    
    
    // Used for card manipulation
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
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
        bio: "Here for a good time, not a long time 😜", distance: 12,
        age: 21, bioLong: "This is a placeholder for a long bio. This is a placeholder for a long bio. This is a placeholder for a long bio. Here for a good time, not a long time ")
    
    static let example1 = Person(
        name: "Judy",
        imageURLS: [
            URL(string: "https://picsum.photos/305")!,
            URL(string: "https://picsum.photos/306")!,
            URL(string: "https://picsum.photos/307")!,
            URL(string: "https://picsum.photos/308")!,
            URL(string: "https://picsum.photos/309")!],
        bio: "Bio", distance: 23,
        age: 21, bioLong: "This is a placeholder for a long bio. This is a placeholder for a long bio. This is a placeholder for a long bio. Here for a good time, not a long time ")
    
    static let example2 = Person(name: "Sam", imageURLS: [URL(string: "https://picsum.photos/id/1027/300")!], bio: "Bio", distance: 5, age: 26, bioLong: "This is a placeholder for a long bio. This is a placeholder for a long bio. This is a placeholder for a long bio. Here for a good time, not a long time ")
    static let example3 = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/id/1/300")!], bio: "My bio", distance: 8, age: 32, bioLong: "This is a placeholder for a long bio. This is a placeholder for a long bio. This is a placeholder for a long bio. Here for a good time, not a long time ")
    static let example4 = Person(name: "Matt", imageURLS: [URL(string: "https://picsum.photos/id/1005/300")!], bio: "dog lover", distance: 3, age: 35, bioLong: "This is a placeholder for a long bio. This is a placeholder for a long bio. This is a placeholder for a long bio. Here for a good time, not a long time ")
    static let example5 = Person(name: "Ashley", imageURLS: [URL(string: "https://picsum.photos/id/1011/300")!], bio: "meow", distance: 1, age: 26, bioLong: "This is a placeholder for a long bio. This is a placeholder for a long bio. This is a placeholder for a long bio. Here for a good time, not a long time ")
    static let example6 = Person(name: "Kira", imageURLS: [URL(string: "https://picsum.photos/800")!], bio: "meow", distance: 9, age: 43, bioLong: "This is a placeholder for a long bio. This is a placeholder for a long bio. This is a placeholder for a long bio. Here for a good time, not a long time ")
}
