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
    
    @State private var imageIndex = 0
    
    @Binding var fullScreenMode: Bool
    
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
                    
                    HStack{
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
                            
                            LinearGradient(colors: [Color.black.opacity(0.01), Color.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                                .frame(height: 200)
                                .blendMode(.darken)
                            
                            
                            
                            
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
                            
                            
                            
                        }
                    }
                }
                .foregroundColor(.white)
            }
            .cornerRadius(6)
            .shadow(radius: 6)
            
        }
    }
}

struct CardImageView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageView(person: Person.example, fullScreenMode: .constant(false))
    }
}
