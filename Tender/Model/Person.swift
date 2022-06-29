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
}

extension Person {
    static let example = Person(name: "Judy", imageURLS: [URL(string: "https://picsum.photos/id/64/300")!])
}
