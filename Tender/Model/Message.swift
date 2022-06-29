//
//  Message.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/15/22.
//

import Foundation

struct Message: Hashable {
    var content: String
    var person: String? = nil
    
    // For a sent message, the person is null. For a recieved message, the sender info is stored in person
    var isFromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content:"Hello there")
    static let exampleRecieved = Message(content:"Heya", person: Person.example.name)
}

