//
//  ImageLoader.swift
//  Buzzz
//
//  Created by MacBook Pro on 01/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    // MARK: - PROPERTIES
    var imageUrl: String
    
    var body: some View {
        WebImage(url: URL(string: imageUrl))
            .onSuccess { image, data, cacheType in
                // Success
            }
            .resizable()
            .indicator(.activity)
            .scaledToFill()
            .clipShape(Circle())
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(imageUrl: "https://s3soft.com/wp-content/uploads/2020/03/logo-1.png")
    }
}
