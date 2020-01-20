//
//  Coordinator.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import UIKit

enum Transition {
    case showIssueDetails(Issue)
}

protocol Coordinator: class {
    var navigationController: UINavigationController? { get set }
    func start()
    
    func performTransition(transition: Transition)
}
