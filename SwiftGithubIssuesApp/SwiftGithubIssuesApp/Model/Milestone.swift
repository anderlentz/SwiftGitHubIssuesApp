//
//  Milestone.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 07/02/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

// MARK: - Milestone
struct Milestone: Codable {
    let url: String
    let htmlURL: String
    let labelsURL: String
    let id: Int
    let nodeID: String
    let number: Int
    let state, title, milestoneDescription: String
    let creator: Creator

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case labelsURL = "labels_url"
        case id
        case nodeID = "node_id"
        case number, state, title
        case milestoneDescription = "description"
        case creator
    }
}
