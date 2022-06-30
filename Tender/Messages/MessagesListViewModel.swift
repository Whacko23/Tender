//
//  MessagesListViewModel.swift
//  Tender
//
//  Created by Rajanish Karki on 6/28/22.
//

import Foundation

class MessageListViewModel: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init(){
        loadPreviews()
    }
    
    func loadPreviews(){
        // Handle networking to load real message previews
        self.messagePreviews = [MessagePreview.example]
    }
}
