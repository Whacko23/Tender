//
//  FullScreenCard.swift
//  Tender
//
//  Created by Rajanish Karki on 8/1/22.
//

import SwiftUI

struct FullScreenCard: View {
    var person: Person
    let screen = UIScreen.main.bounds
    
    @Binding var fullscreenMode: Bool
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false){
                VStack(spacing: 0){
                    CardImageView(person: person, fullScreenMode: $fullscreenMode)
                        .frame(width: screen.size.width, height: screen.size.height * 0.6)
                    
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Text(person.name)
                                    .font(.system(size: 32, weight: .heavy))
                                
                                Text(String(person.age))
                                    .font(.system(size: 28, weight: .light))
                                
                                Spacer()
                                
                            }
                            .opacity(0.75)
                            
                            Text("\(person.distance) miles away")
                                .font(.system(size: 18, weight: .medium))
                                .opacity(0.75)
                        }
                        .padding([.horizontal, .top], 16)
                        
                        Button(action: {}) {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size: 42))
                                .foregroundColor(.red)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .offset(y: -40)
                        .padding(.trailing, 16)
                        
                    }
                    
                    Spacer().frame(height:26)
                    
                    HStack{
                        Text(person.bioLong)
                            .font(.system(size: 18, weight: .medium))
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }
                    
                    Spacer().frame(height:32)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Button(action: {}) {
                            VStack{
                                Text("SHARE \(person.name.uppercased())'S PROFILE")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.pink)
                                
                                Text("SEE WHAT A FRIEND THINKS")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.pink)
                            }
                        }
                        .opacity(0.9)
                        
                        Button(action: {}) {
                            Text("REPORT \(person.name.uppercased())'S PROFILE")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                                .opacity(0.75)
                        }
                    }
                    
                    Spacer().frame(height: 200)
                    
                }
            }
        }
        
    }
}

struct FullScreenCard_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCard(person: Person.example, fullscreenMode: .constant(true))
    }
}
