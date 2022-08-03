//
//  LikesView.swift
//  Tender
//
//  Created by Rajanish Karki on 7/2/22.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user:User {
        return userMng.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("See who already likes you by subscribing to Tender Gold")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
            
            LazyVGrid(
                columns: [GridItem(.flexible()),GridItem(.flexible())],
                alignment: .center,
                spacing: nil,
                pinnedViews: [],
                content: {
                    ForEach(userMng.matches) {person in
                        PersonSquare(person: person, blur: false)
                            .frame(height: 240)
                            .onTapGesture {
                                personTapped(person)
                            }
                    }
                })
            .padding(.horizontal, 6)
            
            
        }//; Scroll view
    }
    
    func personTapped(_ person: Person){
        if user.goldSubscriber{
            appState.showPersonProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
}


struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
