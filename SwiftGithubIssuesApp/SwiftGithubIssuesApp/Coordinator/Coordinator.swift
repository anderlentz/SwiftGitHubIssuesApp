//
//  Coordinator.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        
    }
}
