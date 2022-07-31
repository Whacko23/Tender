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
            let view = CardImageView(person: Person.example, fullScreenMode: $appState.isFullScreenMode)
            return AnyView(view)
        case .search:
            let view = Text("search")
            return AnyView(view)
        case .star:
            let view = MatchesView()
            return AnyView(view)
        case .message:
            let view = MessageListView()
            return AnyView(view)
        case .person :
            let view = ProfileView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                VStack(spacing:0) {
                    
                    
                    HStack {
                        Group {
                            Spacer()
        
                            TabBarButtonView(type: .fire){
                                print("test")
                            }
                        }
                        
                        
                        Group {
//                            Spacer()
//                            TabBarButtonView(type: .search) {
//                                print("test")
//                            }
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
                    .frame(height: 70)
                    .padding(.top, 30)
                    .background(Color(.systemGray6).opacity(0.45))
                    
                    
                    
                    correctViewForState()
                        
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.vertical)
                
                if appState.showPurchasePopup{
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.5))
                        .transition(.offset(y: 1000))
                }
                
            }
            .modifier(HideNavigationView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
