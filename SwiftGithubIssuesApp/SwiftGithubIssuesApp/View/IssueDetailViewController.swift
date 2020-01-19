//
//  IssueDetailViewController.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit

class IssueDetailViewController: UIViewController {
    
    var viewModel: IssueDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init?(coder: NSCoder,issueDetailViewModel: IssueDetailViewModel) {
        self.viewModel = issueDetailViewModel
        super.init(coder:coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
