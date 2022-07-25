//
//  PurchaseOptionView.swift
//  Tender
//
//  Created by Rajanish Karki on 7/24/22.
//

import SwiftUI

struct PurchaseOptionView: View {
    
    var sub: Subscription
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0){
            Text("\(sub.month)")
                .font(.system(size: 44, weight: .light))
            
            Spacer().frame(height: 2)
            
            Text("month\(sub.month > 1 ? "s" : "")")
                .if(isSelected){
                    $0.font(.system(size: 14, weight: .bold))
                }
        }
    }
}

struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        let isSelected = true
        
        PurchaseOptionView(sub: Subscription.example1, isSelected: isSelected)
        PurchaseOptionView(sub: Subscription.example2, isSelected: true)
        PurchaseOptionView(sub: Subscription.example2, isSelected: false)
        PurchaseOptionView(sub: Subscription.example3, isSelected: isSelected)
    }
}
