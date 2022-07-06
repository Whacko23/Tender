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
}

extension User {
    static let example = User(name: "Andy", goldSubscriber: true)
}
