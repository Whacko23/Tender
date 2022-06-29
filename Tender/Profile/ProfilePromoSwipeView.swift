//
//  ProfilePromoSwipeView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/16/22.
//

import SwiftUI


struct ProfilePromoSwipeView: View {
    @EnvironmentObject var appState : AppStateManager
    
//    func buttonText() -> some View{
//        switch appState.selectedPromo {
//        case .platinum :
//            appState.selectedPromo = .platinum
//            return ProfilePromoButton()
//        case .gold:
//            appState.selectedPromo = .gold
//            return ProfilePromoButton()
//        case .silver:
//            appState.selectedPromo = .silver
//            return ProfilePromoButton()
//        }
//
//    }
    
    var body: some View {
        VStack(spacing:0) {
            
            TabView {
                
                ProfilePromoTitleView(title: "Tinder Platinum", description: "Level up every action you take on Tinder", iconColor: Color.black.opacity(0.6))
                
                ProfilePromoTitleView(title: "Tinder Gold", description: "See who likes you now with Tinder Gold", iconColor: Color.yellow)
                
                ProfilePromoTitleView(title: "Tinder Plus", description: "Get Unlimited Likes, Passports & more!")
                
                ProfilePromoTitleView(title: "Upgrade Your Love Life", description: "Unlock the best features Tinder has to offer.", iconColor: Color.pink)
            }
            .tabViewStyle(PageTabViewStyle())
            
            ProfilePromoButton()
                
        }
    }
}

struct ProfilePromoSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ProfilePromoSwipeView()
                .environmentObject(AppStateManager())
        }
        .background(Color.gray.opacity(0.6))
        
    }
}
