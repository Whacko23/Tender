//
//  ProfileView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/22/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var user: User{
        return userMng.currentUser
    }
    
    var backgroundColor: Color{
        if !user.goldSubscriber{
            return Color.gray.opacity(0.2)
        }
        
        return Color.white
    }
    
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
                    
                    Spacer().frame(height:20)
                    
                    ZStack {
                        Circle()
                            .frame(width: 200, height: 200)
                        ProfileImageView(url: user.imageURLS.first)
                            .frame(height: 200)
                    }
                    
                    
                    Text("\(user.name), \(user.age)")
                        .foregroundColor(.textTitle)
                        .font(.system(size: 35, weight: .medium))
                        .padding(.vertical, 15)
                    
                    Spacer().frame(height:30)
                    
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
                    
                    if !user.goldSubscriber{
                        ProfilePromoSwipeView()
                    }
                    
                    Spacer()
                }
            }
        }//: Vstack
        .background(backgroundColor)
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackgroundColor)
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
