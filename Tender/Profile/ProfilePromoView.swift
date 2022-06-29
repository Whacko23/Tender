//
//  ProfilePromoSwipeView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/15/22.
//

import SwiftUI

enum ProfilePromoType: String{
    case platinum = "Platinum"
    case gold = "Gold"
    case silver = "Plus"
}

struct ProfilePromoTitleView: View {
    var title: String
    var description: String
    var iconColor: Color? = Color.red
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Image(systemName: "flame.fill")
                    .font(.system(size: 20))
                    .foregroundColor(iconColor)
                
                Text(title)
                    .font(.system(size: 22, weight: .semibold))
            }//: Hstack
            
            
            Spacer().frame(height: 22)
            
            Text(description)
                .font(.footnote)
        }//: Vstack
        .padding(.bottom, 64)
    }
}

struct ProfilePromoTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePromoTitleView(title: "Tinder Platinum", description: "Level Up")
            .previewLayout(.sizeThatFits)
            .padding()
    
    }
        
        
}
