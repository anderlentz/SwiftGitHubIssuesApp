//
//  AppCoordinator.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    func start() {
        let viewController = MyIssuesViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
