//
//  TabBarButtonView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/5/22.
//

import SwiftUI

enum TabBarButtonType: String {
    case fire = "flame.fill"
    case search = "magnifyingglass.circle.fill"
    case star = "star.fill"
    case message = "message.fill"
    case person = "person.fill"
    
}

struct TabBarButtonView: View {
    @EnvironmentObject var appState: AppStateManager
    
    var type: TabBarButtonType
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {appState.selectedTab = type}) {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .if(appState.selectedTab == type) {
                    $0.foregroundColor(type.rawValue == "star.fill" ? Color.yellow : Color.red)
                }
                .foregroundColor(Color.gray.opacity(0.5))
                
        }
        .frame(height: 28)
    }
}


struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonView(type: .star, action: {
            print("Text")
        })
        .environmentObject(AppStateManager())
        .previewLayout(.sizeThatFits)
        .padding()
        .frame(width: 100, height: 100)
        
    }
}
