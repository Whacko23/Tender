//
//  PersonSquare.swift
//  Tender
//
//  Created by Rajanish Karki on 7/3/22.
//

import SwiftUI
import Kingfisher

struct PersonSquare: View {
    var person: Person
    var blur: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                KFImage(person.imageURLS.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .if(blur) {
                        $0.blur(radius: 25)
                    }
                
                ZStack(alignment: .bottomLeading) {
                    
                    LinearGradient(colors: [Color.black.opacity(0.01), Color.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                        .frame(height: geo.size.height/3)
                        .blendMode(.darken)
                    
                    Text("\(person.name), \(person.age)")
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .if(blur) {
                            $0.redacted(reason: .placeholder)
                            
                        }
                    
                    
                }
            }
            .cornerRadius(16)
        }
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PersonSquare(person: Person.example6, blur: false)
                .frame(width:200, height: 200)
                .padding()
               
            
            PersonSquare(person: Person.example6, blur: false)
                .frame(width:125, height: 125)
                .padding()
               
        }
    }
}
