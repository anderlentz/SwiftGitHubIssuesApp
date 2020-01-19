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
        describe("An initialized viewModel") {
            context("When can not load an avatar") {
                viewModel = IssueDetailViewModel(issue: <#T##Issue#>)
                it("should return an avatar from assets") {
                    
                }
            }
        }
    }
}
