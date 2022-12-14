//
//  SwiftUIView.swift
//  Tender
//
//  Created by Rajanish Karki on 7/31/22.
//

import SwiftUI

struct CardView: View {
    
    @State var person: Person
    @Binding var fullscreenMode: Bool
    
    @EnvironmentObject var userMng: UserManager
    
    let screenCutoff = (UIScreen.main.bounds.width / 2 ) * 0.8
    
    @Namespace var imageNamespace: Namespace.ID
    
    var body: some View {
        GeometryReader { geo in
            if  fullscreenMode {
                FullScreenCard(person: person, fullscreenMode: $fullscreenMode, namespace: imageNamespace)
                    .animation(.easeOut(duration: 0.2))
            } else {
                CardImageView(person: person, fullScreenMode: $fullscreenMode)
                    .frame(width: geo.size.width - 20, height: geo.size.height )
                    .padding(.leading, 10)
                    .offset(x: person.x, y: person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(
                        DragGesture()
                            .onChanged({value in
                                withAnimation(.default){
                                    person.x = value.translation.width
                                    person.y = value.translation.height
                                    withAnimation{
                                        person.degree =
                                        Double((value.translation.width) / 25 * -1)
                                    }
                                }
                            })
                            .onEnded({value in
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)){
                                    let width = value.translation.width
                                    
                                    if width >= 0 && width <= screenCutoff{
                                        //Snap back to the middle
                                        
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    } else if width <= -1 && width >=  -screenCutoff{
                                        //Snap back to the middle
                                        
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    } else if width > screenCutoff {
                                        //Swipe right
                                        
                                        userMng.swipe(person, .like)
                                        person.x = 500
                                        person.degree = 12
                                    } else if width < -screenCutoff {
                                        //Swipe left
                                        
                                        userMng.swipe(person, .nope)
                                        person.x = -500
                                        person.degree = -12
                                    }
                                }
                            })
                    )
                    .matchedGeometryEffect(id: "image\(person.id)", in: imageNamespace.self)
                    .animation(.easeOut(duration: 0.2))
            }
        }
        
    }
}
 
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example, fullscreenMode: .constant(false))
            .environmentObject(UserManager())
        CardView(person: Person.example, fullscreenMode: .constant(true))
            .environmentObject(UserManager())
        
    }
}
