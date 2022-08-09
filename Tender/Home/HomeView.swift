//
//  HomeView.swift
//  Tender
//
//  Created by Rajanish Karki on 8/6/22.
//

import SwiftUI
import CarPlay

struct HomeView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        
        
        
        VStack {
            Spacer()
                .frame(height: 80)
            
            CardStack(people: userMng.cardPeople)
                .offset(y: -60)
        }
        
          
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
