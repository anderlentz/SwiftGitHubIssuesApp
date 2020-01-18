//
//  GithubIssuesApiSpecs.swift
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

class GithubIssuesApiSpecs: QuickSpec {
    
    var stubbingProvider: MoyaProvider<GithubIssuesApi>!
    
    override func spec() {
        describe("A GithubIssuesApi provider") {
            beforeEach {
                self.stubbingProvider = MoyaProvider<GithubIssuesApi>(stubClosure: MoyaProvider.immediatelyStub)
           }
            
            context("Afeter beeing sttubed initialized") {
            
                it("should return a 200 ok response") {
                    self.stubbingProvider.request(.issues(page: 1)) { result in
                    
                        switch result {
                        case .success(let response):
                            expect(response.statusCode).to(equal(200))
                        case .failure:
                            fail("Expecting to get 200  OK response")
                        }
                    }
                }
            }
        }
    }
}
