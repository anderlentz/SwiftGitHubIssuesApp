//
//  IssueDetailCoordinator.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import UIKit

final class IssueDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var selectedIssue: Issue!
    
    init(navController: UINavigationController?, selectedIssue: Issue) {
        self.navigationController = navController
        self.selectedIssue = selectedIssue
    }

    func start() {
        let viewModel = IssueDetailViewModel(issue: selectedIssue)
        
        guard let viewController = MyIssueDetailViewController(issueDetailViewModel: viewModel) else { return }
        
        viewController.title = "Details"
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func performTransition(transition: Transition) {
        
    }
}
