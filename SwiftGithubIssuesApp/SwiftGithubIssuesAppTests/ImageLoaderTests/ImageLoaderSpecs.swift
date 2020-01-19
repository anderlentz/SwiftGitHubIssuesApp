//
//  ImageLoaderSpecs.swift
//  SwiftGithubIssuesAppTests
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya
import Quick
import Nimble

@testable import SwiftGithubIssuesApp

class ImageLoaderSpecs: QuickSpec {
    
    var imageLoader: ImageLoader!
    
    override func spec() {
        describe("an image loader initialized") {
            
            context("when presents a failure on image downloader api") {
                
                let endpointClosure = { (target: ImageDownloaderAPI) -> Endpoint in
                    return Endpoint(url: target.baseURL.absoluteString,
                                    sampleResponseClosure: {.networkResponse(400, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
                }
                
                let provider = MoyaProvider(endpointClosure: endpointClosure)
                
                imageLoader = ImageLoader(imageProviderAPI: provider)
                
                it ("should throw an image not found failure") {
                    
                    self.imageLoader.getImage(imageURl: "www.glovo.com") { result in
                        switch result{
                        case .success:
                            fail("Should return an error")
                        case .failure(let error):
                            expect(error).to(equal(.imageNotFound))
                        }
                    }
                }
            }
        }
    }
}
