//
//  GFAvatarImage.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import SwiftUI
//import UIKit

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(.avatarPlaceholder).resizable()
    }
}


struct GFRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
            .modifier(CellImageStyle())
        
//        AsyncImage(url: URL(string: avatarUrl), content: { image in
//            image
//                .resizable()
//                .modifier(CellImageStyle())
//            
//        }, placeholder: {
//            Image(.avatarPlaceholder)
//                .resizable()
//                .modifier(CellImageStyle())
//        })
    }
}

//#Preview {
//    GFAvatarImage()
//}
