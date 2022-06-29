//
//  ChatManager.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/16/22.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject{
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing : Bool = false
    
    var cancellable: AnyCancellable? = nil
    
    private var person: Person
    
    init(person: Person){
        self.person = person
        loadMessages()
        setupPublishers()
    }
    
    public func sendMessage(_ message: Message){
        // Do some networking here
        messages.append(message)
        // If network fails, display the error here with retry options
    }
    
    private var keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({_ in true})
    
    private var keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({_ in false})
    
    private func setupPublishers(){
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleRecieved]
    }
    
    deinit{
        cancellable?.cancel()
    }
}
