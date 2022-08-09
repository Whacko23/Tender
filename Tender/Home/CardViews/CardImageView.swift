//
//  CardImageView.swift
//  Tender
//
//  Created by Rajanish Karki on 7/28/22.
//

import SwiftUI
import Kingfisher

struct CardImageView: View {
    var person: Person
    
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var userMng: UserManager
    
    @State private var imageIndex = 0
    
    @Binding var fullScreenMode: Bool
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.4
    
    func updateIndexImage(addition: Bool){
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex  = min(max(0, newIndex), person.imageURLS.count - 1)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack { // PhotoView
                    KFImage(person.imageURLS[imageIndex])
                        .placeholder { _ in
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    VStack{ // Nope or Like Overlay
                        HStack {
                            Text("LIKE")
                                .font(.system(size: 42, weight: .bold))
                                .foregroundColor(.green)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 5)
                                .overlay(
                                    Rectangle()
                                        .stroke(.green, lineWidth: 5)
                                )
                                .rotationEffect(Angle(degrees: -25))
                                .opacity(Double(person.x / screenCutoff) - 1 )
                            
                            Spacer()
                            Text("NOPE")
                                .font(.system(size: 42, weight: .bold))
                                .foregroundColor(.red)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 5)
                                .overlay(
                                    Rectangle()
                                        .stroke(.red, lineWidth: 5)
                                )
                                .rotationEffect(Angle(degrees: 25))
                                .opacity(Double(person.x / screenCutoff) * -1 - 1 )
                        }
                        .padding(.top, 50)
                        .padding(.horizontal, 30)
                        
                        Spacer()
                    }
                    
                    HStack{ // 2 Rectangle for tap to like or dislike
                        Rectangle()
                            .onTapGesture{
                                updateIndexImage(addition: false)
                            }
                        
                        Rectangle()
                            .onTapGesture {
                                updateIndexImage(addition: true)
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                }
                
                VStack{
                    HStack{ // Image Indicator
                        ForEach(0..<person.imageURLS.count, id: \.self){ imageIndex in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                                .shadow(radius: 2)
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, fullScreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !fullScreenMode {
                        ZStack(alignment: .bottom) {
                            
                            LinearGradient(colors: [Color.black.opacity(0.01), Color.black], startPoint: .top, endPoint: .bottom)
                                .frame(height: 300)
                                .blendMode(.darken)
                            
                            
                            
                            
                            VStack {
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack{
                                            Text(person.name)
                                                .font(.system(size: 32, weight: .heavy))
                                            
                                            Text(String(person.age))
                                                .font(.system(size: 28, weight: .light))
                                        }
                                        
                                        Text(person.bio)
                                            .font(.system(size: 18, weight: .medium))
                                            .lineLimit(2)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Button ( action: {fullScreenMode = true}) {
                                        Image(systemName: "info.circle.fill")
                                            .font(.system(size: 26, weight: .medium))
                                        
                                    }
                                }
                                .padding(16)
                                
                                HStack {
                                    CircleHomeButton(type: .back, action: {
                                        appState.showPurchaseScreen()
                                    })
                                    .frame(height: 45)
                                    Spacer()
                                    CircleHomeButton(type: .no, action: {
                                        if let person = userMng.cardPeople.last{
                                            userMng.swipe(person, .nope)
                                        }
                                    })
                                    .frame(height: 50)
                                    Spacer()
                                    CircleHomeButton(type: .star, action: {
                                        if let person = userMng.cardPeople.last{
                                            if userMng.currentUser.goldSubscriber {
                                                userMng.superLike(person)
                                            } else {
                                                appState.showPurchaseScreen()
                                            }
                                        }
                                    })
                                    .frame(height: 45)
                                    Spacer()
                                    CircleHomeButton(type: .heart, action: {
                                        if let person = userMng.cardPeople.last{
                                            userMng.swipe(person, .like)
                                        }
                                    })
                                    .frame(height: 50)
                                    Spacer()
                                    CircleHomeButton(type: .lightning, action: {
                                        appState.showPurchaseScreen()
                                    })
                                    .frame(height: 45)
                                }
                                .padding()
                            }
                            
                            
                            
                        }
                    }
                }
                .foregroundColor(.white)
            }
            .cornerRadius(6)
            .shadow(radius: 6)
            
        }
        .background(.white)
    }
}

struct CardImageView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageView(person: Person.example, fullScreenMode: .constant(false))
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
        CardImageView(person: Person.example, fullScreenMode: .constant(true))
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
