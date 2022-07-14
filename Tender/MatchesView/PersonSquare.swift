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
                
                Text("\(person.name), \(person.age)")
                    .padding()
//                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
//                    .background(.black)
//                    .cornerRadius(10)
//                    .opacity(0.7)
//                    .padding(6)
                    .if(blur) {
                        $0.redacted(reason: .placeholder)                 }
            }
            .cornerRadius(16)
        }
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example6, blur: false)
            .frame(width:125, height: 125)
    }
}
