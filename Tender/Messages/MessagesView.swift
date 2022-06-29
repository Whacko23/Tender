//
//  MessagesView.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/15/22.
//

import SwiftUI

struct MessagesView: View {
    var message: Message
    
    var body: some View {
        
        
        HStack {
            if message.isFromCurrentUser{
                Spacer()
            }
            Text(message.content)
                .padding(10)
                .background(message.isFromCurrentUser ? Color.blue : Color.gray.opacity(0.25))
                .foregroundColor(message.isFromCurrentUser ? Color.white : Color.black)
                .cornerRadius(10)
            
            if !message.isFromCurrentUser{
                Spacer()
            }
        }
        .padding(10)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(message: Message.exampleSent)
    }
}
