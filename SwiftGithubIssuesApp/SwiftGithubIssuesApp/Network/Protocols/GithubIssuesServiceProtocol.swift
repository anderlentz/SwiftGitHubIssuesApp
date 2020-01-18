//
//  GithubIssuesServiceProtocol.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

protocol GithubIssuesServiceProtocol {
    func getIssues(page:Int, completion: @escaping (Result<[Issue],Error>) -> Void)
}
