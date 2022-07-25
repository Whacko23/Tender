//
//  PurchaseSwipePromo.swift
//  Tender
//
//  Created by Rajanish Karki on 7/24/22.
//

import SwiftUI

struct PurchaseSwipePromo: View {
    var body: some View {
        TabView {
            VStack(spacing: 10){
                Image(systemName: "thermometer.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already like you!")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them insantly")
            }
            
            VStack(spacing: 10){
                Image(systemName: "paperplane.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already like you!")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them insantly")
            }
            
            VStack(spacing: 10){
                Image(systemName: "calendar.badge.plus")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already like you!")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them insantly")
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct PurchaseSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipePromo()
            .previewLayout(.sizeThatFits)
            .frame(height:UIScreen.main.bounds.height/3)
            .frame(width:UIScreen.main.bounds.width)
            .padding()
            
    }
}
