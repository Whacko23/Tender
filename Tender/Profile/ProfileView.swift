//
//  ProfileView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/22/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .clipShape(
                        Circle()
                            .size(width: 820, height: 800)
                            .offset(x: -200, y: -300)
                    )
                
                VStack(spacing:0){
                    ZStack {
                        Circle()
                            .frame(width: 200, height: 200)
                        ProfileImageView(url: URL(string: "https://picsum.photos/300"))
                            .frame(height: 200)
                    }
                    
                    
                    Text("Ryan, 23")
                        .foregroundColor(.textTitle)
                        .font(.system(size: 35, weight: .medium))
                        .padding(.vertical, 15)
                    
                    Spacer().frame(height:50)
                    
                    HStack(alignment:.top){
                        Spacer()
                        ProfileButtonView(imageName: "gearshape.fill", label: "Settings")
                        Spacer()
                        ProfileButtonView(imageName: "pencil", fontSize: 30, padding: 25, label: "Edit Profile")
                            .offset(y:10)
                        Spacer()
                        ProfileButtonView(imageName: "shield.fill", label: "Safety")
                        Spacer()
                        
                    }
                    .padding(.bottom, 40)
                    
                    ProfilePromoSwipeView()
                }
            }
        }//: Vstack
        .background(Color.gray.opacity(0.2))
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackgroundColor)
    }
}
