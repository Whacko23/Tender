//
//  CircleButtonView.swift
//  Tender
//
//  Created by Rajanish Karki on 8/2/22.
//

import SwiftUI


enum ButtonType: String {
    case back = "gobackward"
    case no = "xmark"
    case star = "star.fill"
    case heart = "heart.fill"
    case lightning = "cloud.bolt.fill"
}

struct CircleButton: ButtonStyle{
    var bgColor: Color? = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Circle()
                    .foregroundColor(bgColor)
                    
                    
            )
            .scaleEffect(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct ColorButton: ViewModifier{
    var type: ButtonType
    
    func body(content: Content) -> some View {
        switch type {
        case .back:
            return AnyView(
                content
                    .foregroundColor(.yellow)
            )
        case .no:
            return AnyView(
                content
                    .foregroundColor(.red)
            )
        case .star:
            return AnyView(
                content
                    .foregroundColor(.blue)
            )
        case .heart:
            return AnyView(
                content
                    .foregroundColor(.green) 
            )
        case .lightning:
            return AnyView(
                content
                    .foregroundColor(.purple)
            )
        }
    }
}

struct ButtonOverlay: ViewModifier{
    var type: ButtonType
    
    func body(content:Content) -> some View{
        switch type {
        case .back:
            return AnyView(
                content
                    .overlay(
                        Circle()
                            .stroke(.yellow)
                    )
            )
        case .no:
            return AnyView(
                content
                    .overlay(
                        Circle()
                            .stroke(.red)
                    )
            )
        case .star:
            return AnyView(
                content
                    .overlay(
                        Circle()
                            .stroke(.blue)
                    )
            )
        case .heart:
            return AnyView(
                content
                    .overlay(
                        Circle()
                            .stroke(.green)
                    )
            )
        case .lightning:
            return AnyView(
                content
                    .overlay(
                        Circle()
                            .stroke(.purple)
                    )
            )
        }
    }
}

struct CircleHomeButton: View {
    var type: ButtonType
    var action: () -> Void
    
    var body: some View{
        Button(action: {action()}) {
            Image(systemName: type.rawValue)
                .resizable()
                .font(.system(size: 12, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .padding(12)
        }
        .buttonStyle(CircleButton(bgColor: .black.opacity(0.8)))
        .modifier(ColorButton(type: type))
        .modifier(ButtonOverlay(type: type))
        
    }
    
    
}

struct CircleButtonView: View {
    var type: ButtonType
    var action: () -> Void
    
    var body: some View {
        Button(action: {action()}) {
            Image(systemName: type.rawValue)
                .resizable()
                .font(.system(size: 12, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .padding(12)
        }
        .buttonStyle(CircleButton())
        .modifier(ColorButton(type: type))
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 50){
                CircleHomeButton(type: .back, action: {})
                    .frame(height:50)
                CircleButtonView(type: .no, action: {})
                    .frame(height:50)
                CircleHomeButton(type: .star, action: {})
                    .frame(height:50)
                CircleButtonView(type: .heart, action: {})
                    .frame(height:50)
                CircleHomeButton(type: .lightning, action: {})
                    .frame(height:50)
            }
        }
    }
}
