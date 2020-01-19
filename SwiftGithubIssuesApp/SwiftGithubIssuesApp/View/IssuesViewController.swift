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
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var issuesTableView: UITableView!
    let viewModel = IssuesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //issuesTableView.delegate = self
        //issuesTableView.dataSource = self
        
        //issuesTableView.rx.items(dataSource: <#T##_#>)
        
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
        
    
//        viewModel.issues.subscribe(onNext:{ issues in
//            print("Issues came from viewModel after subscribing")
//            //print(issues)
//            self.issuesTableView.reloadData()
//        }).disposed(by: disposeBag)
        
        viewModel.getIssues()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension IssuesViewController: UITableViewDelegate,UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = issuesTableView.dequeueReusableCell(withIdentifier: "issueTableCell", for: indexPath) as! IssueTableViewCell
//
//        cell.titleLabel.text = "title label asiaidhv"
//        cell.statusLabel.text = "PENDING"
//        return cell
//    }
//}

