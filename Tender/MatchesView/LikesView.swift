//
//  LikesView.swift
//  Tender
//
//  Created by Rajanish Karki on 7/2/22.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userMng: UserManager
    
    private var user:User {
        return userMng.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade to Gold to see people who already liked you.")
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
                        PersonSquare(person: person, blur: !user.goldSubscriber)
                            .frame(height: 240)
                    }
                })
            .padding(.horizontal, 6)
            
            
        }// Scroll view
        
        
    }
    
}


struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView().environmentObject(UserManager())
    }
}
