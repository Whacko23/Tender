//
//  MessageRowView.swift
//  Tender
//
//  Created by Rajanish Karki on 6/30/22.
//

import SwiftUI
import Kingfisher

struct MessageRowView: View {
    var preview: MessagePreview
    var body: some View {
        HStack {
            ProfileImageView(url: preview.person.imageURLS.first)
                .frame(height: 70)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8){
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                
                Text(preview.lastMessage)
                    .foregroundColor(Color.primaryText)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                
            }
            
            Spacer()
        }
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
