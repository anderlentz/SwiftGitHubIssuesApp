//
//  ImageLoader.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya

class ImageLoader {
    
    let imageLoaderAPI = MoyaProvider<ImageDownloaderAPI>()
    
    func getImage(imageURl: String,completion: @escaping (Result<Data, Error>)-> Void) {
        imageLoaderAPI.request(.download(imageUrlString: imageURl)) { (result) in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
