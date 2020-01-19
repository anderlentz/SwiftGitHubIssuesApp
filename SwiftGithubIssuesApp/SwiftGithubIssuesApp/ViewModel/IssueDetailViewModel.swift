//
//  IssueDetailViewModel.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

class IssueDetailViewModel {
    
    var issue: Issue!
    
    init (issue: Issue) {
        self.issue = issue
    }
    
    func openGitHubLink() {
        guard let url = URL(string: issue.url) else { return }
        print(url.absoluteURL)
    }
    
    func getAvatar(completion: @escaping (Result<Data,Error>) -> Void) {
        
    }
}
