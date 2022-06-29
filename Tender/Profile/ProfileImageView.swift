//
//  RoundedImage.swift
//  Tender
//
//  Created by Rajanish Karki on 6/15/22.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    var url: URL? = URL(string: "https://picsum.photos/300")
    
    
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
