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

@testable import SwiftGithubIssuesApp

class IssuesViewModelSpecs: QuickSpec {
    
    var issuesViewModel: IssuesViewModel?
    
    override func spec() {
        describe("An IssuesViewModel") {
            context("After being initialized") {
                beforeEach {
                    self.issuesViewModel = IssuesViewModel()
                }
                
            }
        }
    }
    
}
