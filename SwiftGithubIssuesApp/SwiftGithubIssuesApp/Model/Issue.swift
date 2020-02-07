//
//  Issue.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let issue = try? newJSONDecoder().decode(Issue.self, from: jsonData)

import Foundation

// MARK: - Issue
struct Issue: Codable {
    let url, repositoryURL: String
    let labelsURL: String
    let commentsURL, eventsURL, htmlURL: String
    let id: Int
    let nodeID: String
    let number: Int
    let title: String
    let user: User
    let labels: [Label?]
    let state: String
    let locked: Bool
    //let assignee: Assignee?
    //let assignees: [Assignee?]
    //let milestone: Milestone?
    let comments: Int
    var createdAt, updatedAt: String?
    let closedAt: String?
    let authorAssociation: String
    //let pullRequest: PullRequest?
    let body: String

    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case number, title, user, labels, state, locked, comments
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case authorAssociation = "author_association"
        case body
    }
}
