//
//  ImageCache.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import SwiftUI

actor ImageCache {
    static let shared = ImageCache()
    
    private var cache: NSCache<NSURL, UIImage> = {
        let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 100
        return cache
    }()
    
    func insert(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
    
    func get(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }
    
    func clear() {
        cache.removeAllObjects()
    }
}

actor ImageLoadingService {
    static let shared = ImageLoadingService()
    
    func loadImage(from url: URL) async throws -> UIImage {
        if let cachedImage = await ImageCache.shared.get(for: url) {
            return cachedImage
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeContentData)
        }
        await ImageCache.shared.insert(image, for: url)
        return image
    }
}
