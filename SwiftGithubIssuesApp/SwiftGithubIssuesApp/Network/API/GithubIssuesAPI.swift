//
//  GithubIssuesAPI.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya

enum GithubIssuesApi{
    case issues(page:Int)
}

extension GithubIssuesApi: TargetType {

    var baseURL: URL {
        guard let url =  URL(string: "https://api.github.com/repos/apple/swift/") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .issues:
            return "issues"
            
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .issues:
            return .get
            
        }
            
    }
            
    var sampleData: Data {
        switch self {
        case .issues:
            
            guard let path2 = Bundle.main.path(forResource: "issues", ofType: "json"),
                let data = NSData(contentsOfFile: path2) else { return Data() }
        
            return Data(referencing: data)
        }
    }
            
    var task: Task {
        switch self {
        case .issues:
            guard let param = parameters else { fatalError("Missing parameters")}
            
            let request = Task.requestParameters(parameters: param, encoding: parameterEncoding)
            return request
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
            
}

extension GithubIssuesApi {
    var parameters: [String: Any]? {
        switch self {
        case .issues(let page):
            return ["page":page]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .issues:
            return URLEncoding.queryString
        }
    }
}
