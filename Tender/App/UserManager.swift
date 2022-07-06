//
//  UserManager.swift
//  Tender
//
//  Created by Rajanish Karki on 7/2/22.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    @Published var matches: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
    }
    
    private func loadUser(){
        self.currentUser = User.example
    }
    
    private func loadMatches(){
        self.matches = [Person.example, Person.example2, Person.example3, Person.example4, Person.example5, Person.example6]
    }
}
