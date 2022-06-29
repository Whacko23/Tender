//
//  ChatView.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/17/22.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMng: ChatManager
    
    @State private var typedMessage: String = ""
    
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person){
        self.person = person
        self.chatMng = ChatManager(person: person)
    }
    
    
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack {
                Spacer().frame(height: 75)
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        
                        LazyVStack{
                            ForEach(chatMng.messages.indices, id: \.self) { index in
                                let message = chatMng.messages[index]
                                MessagesView(message: message)
                                    .id(index)
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                        .onChange(of: chatMng.messages) { _ in
                           // proxy.scrollTo(chatMng.messages.count  - 1)
                            scrollToBottom()
                        }
                    }//: ScrollView REader
                }//: ScrollView
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBG
                     
                    TextField("Type a message", text: $typedMessage)
                        .foregroundColor(.primaryText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button(action: {sendMessage()}) {
                        Text("Send")
                            .foregroundColor(typedMessage.isEmpty ? Color.secondaryText : Color.blue)
                    }
                    .padding(.horizontal)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1 )
                )
                .padding(.horizontal)
                .padding(.bottom)
                
            }//: VStack
            
            ChatHeaderView(name: Person.example.name, imageURL: Person.example.imageURLS.first, videoAction: {}, shieldAction: {})
        }//: ZStack
        .navigationTitle("")
        .navigationBarHidden(true)
        .onChange(of: chatMng.keyboardIsShowing, perform: { value in
            if value {
                scrollToBottom()
            }
        })
        .onChange(of: chatMng.messages, perform: { _ in
            scrollToBottom()
        })
       
        
    }
    
    func sendMessage(){
        chatMng.sendMessage(Message(content: typedMessage))
        typedMessage = ""
    }
    
    func scrollToBottom(){
        withAnimation {
            scrollProxy?.scrollTo((chatMng.messages.count - 1), anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatView(person: Person.example)
                .previewDevice("iPhone 11")
        }
    }
}
