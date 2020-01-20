//
//  MyIssuesViewController.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MyIssuesViewController: UIViewController {
    
    let viewModel: IssuesViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var issuesTableView: UITableView!
    
    
    init?(viewModel: IssuesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let cell = UINib.init(nibName: "IssueTableViewCell", bundle: Bundle.main)
        
        issuesTableView.register(cell, forCellReuseIdentifier: "IssueTableViewCell")
        
        viewModel.issues.bind(to: issuesTableView.rx.items) { (tv, row, item) -> UITableViewCell in
            
            let cell = self.issuesTableView.dequeueReusableCell(withIdentifier: "IssueTableViewCell",for: IndexPath.init(row: row, section: 0)) as! IssueTableViewCell
            
            cell.titleLabel.text = item.title
            cell.statusLabel.text = item.state
            
            return cell
        }.disposed(by: disposeBag)
        
        
        issuesTableView.rx
            .modelSelected(Issue.self)
            .bind(to: viewModel.selectedIssue)
            .disposed(by: disposeBag)
        
        viewModel.getIssues()
        
    }
    
    
}
