//
//  GFRemoteImage.swift
//  GHFollowers
//
//  Created by Maxim Datskiy on 3/30/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        Task { image = await NetworkManager.shared.downloadImage(fromURLString: urlString) ?? Image(.avatarPlaceholder) }
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
    
    init(urlString: String) { self.urlString = urlString }

    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}


#Preview {
    GFRemoteImage(urlString: MockData.sampleFollower.avatarUrl)
}
