//
//  IssueDetailViewModel.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

class IssueDetailViewModel {
    
    var issue: Issue!
    let imageLoader = ImageLoader()
    
    init (issue: Issue) {
        self.issue = issue
    }
    
    func openGitHubLink() {
        guard let url = URL(string: issue.url) else { return }
        print(url.absoluteURL)
    }
    
    func getAvatar(completion: @escaping (Data) -> Void) {
        imageLoader.getImage(imageURl: issue.user.avatarURL) { (result) in
            switch result{
            case .success(let data):
                print("veio a parada \n \(data)")
                completion(data)
            case .failure(let err):
                print("Error: \(err)")
                guard let path = Bundle.main.path(forResource: "user", ofType: "png") else {fatalError("Must have an image placeholder")}
                
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    completion(data)
                    
                } catch let error {
                    fatalError()
                    print("Error loading image data")
                    print(error)
                }
                
                //UIImage(named: "green-square-Retina")
                completion(Data())
            }
        }
    }
}
