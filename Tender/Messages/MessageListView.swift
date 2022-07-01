//
//  MessageListView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/28/22.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListViewModel = MessageListViewModel()
    
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                //SEarch BAr
                HStack {
                    TextField("SearchBar", text: $searchText )
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textFieldBG)
                        .cornerRadius(8)
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")                            .foregroundColor(.primaryText)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 4)
                                
                                Spacer()
                            }
                        )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .animation(.easeIn(duration: 0.15), value: isEditing)
                    
                    
                    if isEditing {
                        Button {
                            self.searchText = ""
                            self.isEditing = false
                            self.endTextEditing()
                        } label: {
                            Text("Cancel")
                                
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.15))
                    }

                    
                }//: Hstack
                
                Spacer().frame(height: 20)
                
                VStack(){
                    ForEach(vm.messagePreviews, id:\.self) { preview in
                        
                        NavigationLink {
                            ChatView(person: preview.person)
                        } label: {
                            MessageRowView(preview: preview)
                                .padding(.vertical, 12)
                        }
                        .buttonStyle(PlainButtonStyle())

                        
                    }
                }
                
                
                
                Spacer()
            }
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
            .modifier(HideNavigationView())        }
        
    }
}
