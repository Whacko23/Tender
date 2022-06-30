//
//  Extension.swift
//  Tinder
//
//  Created by Rajanish Karki on 6/6/22.
//

import SwiftUI

extension View {
  @ViewBuilder
  func `if`<Transform: View>(
    _ condition: Bool,
    transform: (Self) -> Transform
  ) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}


extension Color {
    static let defaultBackgroundColor = Color(.systemGray6).opacity(0.35)
    static let primaryText = Color.gray.opacity(0.9)
    static let secondaryText = Color.gray.opacity(0.6)
    static let textTitle = Color.black.opacity(0.8)
    static let textFieldBG = Color(.systemGray6)
}

extension View {
    //Deprecated
    
//    func endEditing(_ force: Bool){
//     UIApplication.shared.windows.forEach({$0.endEditing(force)})
//
//
//    }
    
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
      }
    
}
