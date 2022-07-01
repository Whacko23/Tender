//
//  MessagePreview.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/15/22.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: Message.exampleSent.content)
    
    static let examples = [
        MessagePreview(person: Person.example, lastMessage: Message.exampleSent.content),
        MessagePreview(person: Person.example2, lastMessage: "I just bought a 24 pack corona. Bring some food"),
        MessagePreview(person: Person.example3, lastMessage: "Send me a good movie name"),
        MessagePreview(person: Person.example4, lastMessage: "Need you to pik me up tonigh after work"),
        MessagePreview(person: Person.example5, lastMessage: "Saw you with another girl on my dream tonight"),
    ]
}
