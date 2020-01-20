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
    var selectedIssue = PublishSubject<Issue>()
    var provider: MoyaProvider<GithubIssuesApi>!

    var navigationCoordinator: Coordinator?
    
    private let disposeBag = DisposeBag()
    
    init(githubIssuesAPI: MoyaProvider<GithubIssuesApi>,navigationCoordinator:  Coordinator?) {
        self.provider = githubIssuesAPI
        self.navigationCoordinator = navigationCoordinator
        self.setup()
    }
    
    init(provider: MoyaProvider<GithubIssuesApi> = MoyaProvider<GithubIssuesApi>(), navigationCoordinator: Coordinator?) {
        self.provider = provider
        self.navigationCoordinator = navigationCoordinator
        self.setup()
    }
    
    private func setup() {
        selectedIssue.asObservable()
            .subscribe(onNext: { issue  in
                self.navigationCoordinator?.performTransition(transition: .showIssueDetails(issue))
            })
        .disposed(by: disposeBag)
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
