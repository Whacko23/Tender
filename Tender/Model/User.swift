//
//  User.swift
//  Tender
//
//  Created by Rajanish Karki on 7/2/22.
//

import Foundation

struct User {
    var name: String
    var goldSubscriber = false
    var imageURLS: [URL] = []
    var age: Int
}

extension User {
    static let example = User(
        name: "Andy",
        goldSubscriber: false,
        imageURLS: [URL(string: "https://picsum.photos/300")!],
        age: 25)
}
