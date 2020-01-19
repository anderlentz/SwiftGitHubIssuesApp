//
//  IssuesDetailViewModelSpecs.swift
//  SwiftGithubIssuesAppTests
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Moya

@testable import SwiftGithubIssuesApp


class IssuesDetailViewModelSpecs: QuickSpec {
    
    var viewModel: IssueDetailViewModel!
    
    override func spec() {
        
        describe("An initialized viewModel with an non-empty issue") {
            
            let fakeIssue = FakeData().issue!
            viewModel = IssueDetailViewModel(issue: fakeIssue)
            
            context("When get title") {
               
                it("should return a not formatted issue title") {
                    self.viewModel.getTitle { title in
                        expect(title).to(equal("build: simplify, inline tool version recording"))
                    }
                }
            }
            
            context("When get issue description ") {
               
                it("should return a not formatted issue description") {
                    self.viewModel.getIssueDescription{ description in
                        expect(description).to(equal(fakeIssue.body))
                    }
                }
            }
            
            context("When get a non-empty issue creation date") {
               
                it("should return a not formatted issue date") {
                    self.viewModel.getIssueCreationDate { date in
                        expect(date).to(equal("2020-01-18T18:23:46Z"))
                    }
                }
            }
            
            context("When get nil creation date") {
                
                beforeEach {
                    var fakeIssue = FakeData().issue!
                    fakeIssue.createdAt = nil
                    self.viewModel = IssueDetailViewModel(issue: fakeIssue)
                }
               
                it("should return an empty String") {
                    self.viewModel.getIssueCreationDate { date in
                        expect(date).to(equal(""))
                    }
                }
            }
        }
    }
    
}
