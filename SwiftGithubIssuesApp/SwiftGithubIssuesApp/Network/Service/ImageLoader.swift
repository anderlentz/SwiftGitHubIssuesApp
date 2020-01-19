//
//  ImageLoader.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya

enum ImageLoaderError: Error{
    case imageNotFound
    case other
}
    

class ImageLoader {
    
    var imageLoaderAPI: MoyaProvider<ImageDownloaderAPI>!
    
    init (imageProviderAPI: MoyaProvider<ImageDownloaderAPI> = MoyaProvider<ImageDownloaderAPI>()) {
        self.imageLoaderAPI = imageProviderAPI
    }
    
    func getImage(imageURl: String,completion: @escaping (Result<Data, ImageLoaderError>)-> Void) {
        imageLoaderAPI.request(.download(imageUrlString: imageURl)) { (result) in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure:
                completion(.failure(.imageNotFound))
            }
        }
        
    }
}
