//
//  AppCoordinator.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {

    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {

        let viewModel = IssuesViewModel(navigationCoordinator: self)
        
        guard let viewController = MyIssuesViewController(viewModel: viewModel) else { return }
        
        viewController.title = "Issues"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func performTransition(transition: Transition) {
        switch transition {
        case .showIssueDetails(let issue):

            let issueDetailCoordnator = IssueDetailCoordinator(navController: navigationController, selectedIssue: issue)
            issueDetailCoordnator.start()
            
        }
    }
}
