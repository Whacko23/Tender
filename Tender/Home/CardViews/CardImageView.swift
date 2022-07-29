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
        }
    }
}

struct CardImageView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageView(person: Person.example)
    }
}
