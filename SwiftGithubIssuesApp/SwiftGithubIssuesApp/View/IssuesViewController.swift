//
//  IssuesViewController.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class IssuesViewController: UIViewController {

    @IBOutlet weak var issuesTableView: UITableView!
    
    let viewModel = IssuesViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        viewModel.issues.bind(to: issuesTableView.rx.items) { (tv, row, item) -> UITableViewCell in
                        
            let cell = self.issuesTableView.dequeueReusableCell(withIdentifier: "issueTableCell",for: IndexPath.init(row: row, section: 0)) as! IssueTableViewCell
            
            cell.titleLabel.text = item.title
            cell.statusLabel.text = item.state
            
            return cell
        }.disposed(by: disposeBag)
            
        
        issuesTableView.rx.modelSelected(Issue.self)
            .subscribe(onNext: {issue in
                guard let issueDetailVC = self.storyboard?.instantiateViewController(identifier: "IssueDetailViewController", creator: { coder in
                    let issueDetailViewModel = IssueDetailViewModel(issue: issue)
                    return IssueDetailViewController(coder: coder, issueDetailViewModel: issueDetailViewModel)
                }) else {return}
                
                self.navigationController?.pushViewController(issueDetailVC, animated: true)
            }
        ).disposed(by: disposeBag)
        
        viewModel.getIssues()
        
    }
}


