//
//  IssuesViewModel.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class IssuesViewModel {
        
    var issues = PublishSubject<[Issue]>()
    
    var provider: MoyaProvider<GithubIssuesApi>!
    
    init(githubIssuesAPI: MoyaProvider<GithubIssuesApi>) {
        self.provider = githubIssuesAPI
    }
    
    init(provider: MoyaProvider<GithubIssuesApi> = MoyaProvider<GithubIssuesApi>()) {
        self.provider = provider
    }
    
    func getIssues() {
        provider.request(.issues(page: 1)) { (result) in
            switch result {
            case .success(let response):
                
                do {
                    let results = try JSONDecoder().decode(Array<Issue>.self, from: response.data)
                    self.issues.onNext(results)
                    
                } catch let error {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
