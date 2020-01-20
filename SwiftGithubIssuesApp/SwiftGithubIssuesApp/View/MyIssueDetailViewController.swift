//
//  MyIssueDetailViewController.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 20/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit

class MyIssueDetailViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: IssueDetailViewModel!

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - IBActions
    @IBAction func openGithubLinkAction(_ sender: Any) {
    }
    
    init?(issueDetailViewModel: IssueDetailViewModel) {
        self.viewModel = issueDetailViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemwnted")
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
}
