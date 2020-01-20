//
//  MyIssueDetailsViewController.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit

class MyIssueDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    @IBAction func openGithubButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
