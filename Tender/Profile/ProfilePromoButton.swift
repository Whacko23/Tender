//
//  ProfilePromoButton.swift
//  Tender
//
//  Created by Rajanish Karki on 6/16/22.
//

import SwiftUI



struct ProfilePromoButton: View {
    @EnvironmentObject var appState: AppStateManager
    
    var message: String? = "Learn More"
    var iconColor: Color? = Color.red
//    var selectedPromo: ProfilePromoType
//
//    mutating func selectCorrectButton(){
//        switch selectedPromo{
//        case .platinum:
//            message = "Get Tinder Platinum"
//            iconColor = Color.gray.opacity(0.6)
//        case .gold:
//            message = "Get Tinder Gold"
//            iconColor = Color.yellow
//        case .silver:
//            message = "See the Plan"
//            iconColor = Color.red
//        }
//    }
    
    var body: some View {
        Button(action: {
            appState.showPurchaseScreen()
//            appState.selectedPromo =
            
        })
        {
            Text(message!)
                .foregroundColor(iconColor)
                .font(.system(size: 18, weight: .semibold))
                .padding(.vertical, 20)
                .padding(.horizontal, 50)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.gray.opacity(0.2), radius: 10)

        }
        .padding(.bottom, 30)
        
    }
}

struct ProfilePromoButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePromoButton()
            .previewLayout(.sizeThatFits)
            .padding(50)
            .background(Color.defaultBackgroundColor)
            .environmentObject(AppStateManager())
            
            
    }
}
