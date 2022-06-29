//
//  ProfileButtonView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/14/22.
//

import SwiftUI

struct ProfileButtonView: View {
    var imageName: String
    var backgroundColor: Color? = Color.white
    var foregroundColor: Color? = Color.gray
    var fontSize: CGFloat? = 20
    var padding: CGFloat? = 15
    var label: String
    
    var body: some View {
        Button(action: {})  {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(foregroundColor?.opacity(0.6))
                    .font(.system(size: fontSize!))
                    .padding(padding!)
                    .background(backgroundColor)
                    .clipShape(Circle())
                    .shadow(radius: 6)
                
                Text(label.uppercased())
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.primaryText)
                    .padding(.top, 10)
            }
        }
    }
}

struct ProfileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonView(imageName: "pencil", label: "Edit")
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
