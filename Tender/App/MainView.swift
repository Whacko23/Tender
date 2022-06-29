//
//  MainView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/22/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppStateManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
        case .fire:
            let view = Text("fire")
            return AnyView(view)
        case .search:
            let view = Text("search")
            return AnyView(view)
        case .star:
            let view = Text("star")
            return AnyView(view)
        case .message:
            let view = Text("message")
            return AnyView(view)
        case .person :
            let view = Text("person")
            return AnyView(view)
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                
                
                HStack {
                    Group {
                        Spacer()
    
                        TabBarButtonView(type: .fire){
                            print("test")
                        }
                    }
                    
                    
                    Group {
                        Spacer()
                        TabBarButtonView(type: .search) {
                            print("test")
                        }
                    }
                    
                    Spacer()
                    
                    TabBarButtonView(type: .star){
                        print("test")
                    }
                    
                    Spacer()
                    
                    TabBarButtonView(type: .message){
                        print("test")
                    }
                    
                    Spacer()
                    
                    TabBarButtonView(type: .person){
                        print("test")
                    }
                    
                    Spacer()
                    
                   
                }//: Hstack
                .frame(height: 100)
                .padding(.vertical, 30)
                
                correctViewForState()
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.vertical)
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
    }
}
