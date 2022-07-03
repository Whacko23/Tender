//
//  UserManager.swift
//  Tender
//
//  Created by Rajanish Karki on 7/2/22.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    
    init() {
        loadUser()
    }
    
    private func loadUser(){
        self.currentUser = User.example
    }
}
