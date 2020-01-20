//
//  IssuesViewModelSpecs.swift
//  SwiftGithubIssuesAppTests
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Moya
@testable import SwiftGithubIssuesApp

class IssuesViewModelSpecs: QuickSpec {
    
    var issuesViewModel: IssuesViewModel!
    
    override func spec() {
        describe("An IssuesViewModel") {
            context("After being initialized") {
                beforeEach {
                    let issuesAPI = MoyaProvider<GithubIssuesApi>(stubClosure: MoyaProvider.immediatelyStub)
                    self.issuesViewModel = IssuesViewModel(githubIssuesAPI: issuesAPI)
                }

                it("should parse json into array containing 1 issue"){
                    
//                    self.issuesViewModel.getIssues()
                    
                    //self.issuesViewModel.issues.on(Event<[Issue]>)
                    
//                    self.issuesViewModel.getIssues(){ result in
//                        switch result {
//                        case .success(let issues):
//                            expect(issues.count).to(equal(1))
//                        case .failure:
//                            fail("It was expect to parse issues json")
//                        }
//                    }
                }
                
            }
        }
    }
    
}
