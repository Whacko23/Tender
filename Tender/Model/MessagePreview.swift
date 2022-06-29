//
//  MessagePreview.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/15/22.
//

import Foundation

struct MessagePreview {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: Message.exampleSent.content)
}
