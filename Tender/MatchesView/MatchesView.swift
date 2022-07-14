//
//  MatchesView.swift
//  Tender
//
//  Created by Rajanish Karki on 7/13/22.
//

import SwiftUI

struct MatchesView: View {
    
    @State private var selectedTab: LikedTab = .likes
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var buttonText: String {
        if selectedTab  == .likes {
            return "SEE WHO LIKES YOU"
        } else {
            return "UNLOCK TOP PICKS"
        }
    }
    
    private func buttonAction(){
        appState.showPurchaseScreen()
    }
    
    enum LikedTab{
        case likes
        case topPicks
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing:0) {
                HStack {
                    Spacer()
                    
                    Button(action: {selectedTab = .likes}) {
                        Text("\(userMng.matches.count) Likes")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .topPicks){
                                $0.foregroundColor(.primaryText)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {selectedTab = .topPicks}) {
                        Text("\(userMng.matches.count) Top Picks")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .likes){
                                $0.foregroundColor(.primaryText)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical, 14)
                
                if selectedTab == .likes{
                    LikesView()
                } else {
                    TopPicksView()
                }
                
                Spacer()
            }
            
            Button(action: {}) {
                Text(buttonText)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 36)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(30)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
