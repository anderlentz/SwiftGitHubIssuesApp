//
//  IssueDetailCoordinator.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

final class IssueDetailCoordinator: Coordinator {
    func start() {
        
        let viewController = MyIssueDetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
