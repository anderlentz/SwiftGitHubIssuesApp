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
        
        viewModel.getAvatar { [weak self] (result) in
            self?.avatarImageView.image = UIImage(data: result)
        }
        
        viewModel.getTitle { [weak self ]title in
            self?.titleLabel.text = title
        }
        
        viewModel.getIssueDescription { [weak self] description in
            self?.descriptionLabel.text = description
        }
        
        viewModel.getIssueCreationDate { [weak self] date in
            self?.createdAtLabel.text = date
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
