//
//  CardStack.swift
//  Tender
//
//  Created by Rajanish Karki on 8/7/22.
//

import SwiftUI

struct CardStack: View {
    
    var people: [Person]
    @State private var fullScreen: Bool = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack{
            ForEach(people){person in
                CardView(person: person, fullscreenMode: $fullScreen)
            }
        }
        .frame(width:screen.width, height: fullScreen ? screen.height : screen.height * 0.8 )
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: Person.examples)
    }
}
