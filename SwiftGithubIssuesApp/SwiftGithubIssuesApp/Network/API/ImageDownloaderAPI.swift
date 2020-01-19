//
//  ImageDownloaderAPI.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya

enum ImageDownloaderAPI {
    case download(imageUrlString: String)
}

extension ImageDownloaderAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .download(let url):
            guard let url = URL(string: url) else { fatalError("baseURL could not be configured.")}
            return url}
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return Task.requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
