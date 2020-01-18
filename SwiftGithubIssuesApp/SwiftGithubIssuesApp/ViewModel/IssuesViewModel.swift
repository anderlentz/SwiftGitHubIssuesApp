//
//  IssuesViewModel.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya

class IssuesViewModel {
    
    var provider: MoyaProvider<GithubIssuesApi>!
    
    init(githubIssuesAPI: MoyaProvider<GithubIssuesApi>) {
        self.provider = githubIssuesAPI
    }
    
    func getIssues(completion: @escaping (Result<[Issue],Error>) -> Void) {
        provider.request(.issues(page: 1)) { (result) in
            switch result {
            case .success(let response):
                
                do {
                    let results = try JSONDecoder().decode(Array<Issue>.self, from: response.data)
                    print("Results: \(results)")
                    completion(.success(results))
                    
                } catch let error {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
