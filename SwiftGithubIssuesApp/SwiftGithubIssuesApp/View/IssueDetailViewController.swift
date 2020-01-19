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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    @IBAction func openGithubIssueAction(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = viewModel.issue.title
        descriptionLabel.text = viewModel.issue.body
        createdAtLabel.text = viewModel.issue.createdAt
        
        //avatarImageView.image = UIImage(data: <#T##Data#>)
        
        viewModel.getAvatar { [weak self] (result) in
            print("Result do avatar")
            print(result)
            
            
            self?.avatarImageView.image = UIImage(data: result)
        }
        
    }
    
    init?(coder: NSCoder,issueDetailViewModel: IssueDetailViewModel) {
        self.viewModel = issueDetailViewModel
        super.init(coder:coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
