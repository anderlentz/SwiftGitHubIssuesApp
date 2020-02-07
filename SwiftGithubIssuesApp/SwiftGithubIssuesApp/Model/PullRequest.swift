//
//  PullRequesrt.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 07/02/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

// MARK: - PullRequest
struct PullRequest: Codable {
    let url, htmlURL: String
    let diffURL: String
    let patchURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }
}
