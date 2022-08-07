//
//  CardStack.swift
//  Tender
//
//  Created by Rajanish Karki on 8/6/22.
//

import SwiftUI

struct CardStack: View {
    @State private var fullscreenMode: Bool = false
    let screen = UIScreen.main.bounds
    
    var people: [Person]
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, fullscreenMode: $fullscreenMode)
            }
        }
        .frame(width: screen.width, height: fullscreenMode ? screen.height : 550)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: Person.examples)
    }
}
