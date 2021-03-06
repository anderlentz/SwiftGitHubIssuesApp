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
    let imageLoader: ImageLoader!
    
    init (issue: Issue,imageLoader:ImageLoader = ImageLoader()) {
        self.issue = issue
        self.imageLoader = imageLoader
    }
    
    func openGitHubLink() {
        guard let url = URL(string: issue.url) else { return }
        print(url.absoluteURL)
    }
    
    func getAvatar(completion: @escaping (Data) -> Void) {
        imageLoader.getImage(imageURl: issue.user.avatarURL) { (result) in
            switch result{
            case .success(let data):
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
                completion(Data())
            }
        }
    }
    
    func getTitle(completion: @escaping (String) -> Void) {
        completion(issue.title)
    }
    
    func getIssueDescription(completion: @escaping (String) -> Void) {
        completion(issue.body)
    }
    
    func getIssueCreationDate(completion: @escaping (String) -> Void) {
        
        if let createdAt = issue.createdAt {
            completion(createdAt)
        } else {
            completion("")
        }
        
    }
}
