//
//  ChatHeaderView.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/17/22.
//

import SwiftUI

struct ChatHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let name: String
    let imageURL: URL?
    let videoAction: () -> Void
    let shieldAction: () -> Void

    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            HStack{
                Button(action: {presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primaryText )
                        .font(.system(size: 28, weight: .semibold))
                }
                .padding(.leading, 20)
                
                
                Spacer()
                
                VStack{
                    ProfileImageView(url: imageURL)
                        .frame(height: 40)
                        .padding(.top, 10)
                    
                    Text(name)
                        .foregroundColor(Color.secondaryText)
                        .font(.system(size: 14))
                }
                
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "video.fill")
                        .font(.system(size: 22, weight: .semibold))
                    
                }

                Button(action: {}) {
                    Image(systemName: "shield.fill")
                        .font(.system(size: 22, weight: .semibold))
                }
                .padding(.trailing, 10)
                
            }//: Hstack
            .padding(.vertical, 10)
            
        }
        .frame(height: 50)
    }
}

struct ChatHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeaderView(name: Person.example.name, imageURL: Person.example.imageURLS.first, videoAction: {}, shieldAction: {} )
    }
}
