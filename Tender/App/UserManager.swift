//
//  UserManager.swift
//  Tender
//
//  Created by Rajanish Karki on 7/2/22.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0)
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var cardPeople: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople(){
        self.cardPeople = [Person.example, Person.example2, Person.example3, Person.example4, Person.example5, Person.example6]
        
    }
    
    private func loadUser(){
        self.currentUser = User.example
    }
    
    private func loadMatches(){
        self.matches = [Person.example, Person.example2, Person.example3, Person.example4, Person.example5, Person.example6]
    }
    
    private func loadTopPicks(){
        self.topPicks = [Person.example, Person.example2, Person.example3, Person.example4, Person.example5, Person.example6].shuffled()
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection){
        //Network call letting backend know that the user swiped
        cardPeople.removeLast()
    }
    
    public func superLike(_ person: Person){
        
        cardPeople.removeLast()
    }
    
    enum SwipeDirection{
        case like
        case nope
        
    }
}
