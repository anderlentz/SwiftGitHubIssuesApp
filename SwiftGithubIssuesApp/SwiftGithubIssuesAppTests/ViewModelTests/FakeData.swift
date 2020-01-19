//
//  FakeData.swift
//  SwiftGithubIssuesAppTests
//
//  Created by Anderson on 19/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

@testable import SwiftGithubIssuesApp

struct FakeData {
    var user = User(login: "compnerd",
                    id: 63311,
                    nodeID: "MDQ6VXNlcjYzMzEx",
                    avatarURL: "https://avatars3.githubusercontent.com/u/63311?v=4",
                    gravatarID: "",
                    url: "https://api.github.com/users/compnerd",
                    htmlURL: "https://github.com/compnerd",
                    followersURL: "https://api.github.com/users/compnerd/followers",
                    followingURL: "https://api.github.com/users/compnerd/following{/other_user}",
                    gistsURL: "https://api.github.com/users/compnerd/gists{/gist_id}",
                    starredURL: "https://api.github.com/users/compnerd/starred{/owner}{/repo}",
                    subscriptionsURL: "https://api.github.com/users/compnerd/subscriptions",
                    organizationsURL: "https://api.github.com/users/compnerd/orgs",
                    reposURL: "https://api.github.com/users/compnerd/repos",
                    eventsURL: "https://api.github.com/users/compnerd/events{/privacy}",
                    receivedEventsURL: "https://api.github.com/users/compnerd/received_events",
                    type: "User",
                    siteAdmin: false)
    
    var issue: Issue!
    
    init() {
        
        let pullRequest = PullRequest(url: "https://api.github.com/repos/apple/swift/pulls/29302",
                                      htmlURL: "https://github.com/apple/swift/pull/29302",
                                      diffURL: "https://github.com/apple/swift/pull/29302.diff",
                                      patchURL: "https://github.com/apple/swift/pull/29302.patch")
        
        self.issue = Issue(url: "https://api.github.com/repos/apple/swift/issues/29302",
                             repositoryURL: "https://api.github.com/repos/apple/swift",
                             labelsURL: "https://api.github.com/repos/apple/swift/issues/29302/labels{/name}",
                             commentsURL: "https://api.github.com/repos/apple/swift/issues/29302/comments",
                             eventsURL: "https://api.github.com/repos/apple/swift/issues/29302/events",
                             htmlURL: "https://github.com/apple/swift/pull/29302",
                             id: 551805164,
                             nodeID: "MDExOlB1bGxSZXF1ZXN0MzY0NDUxMzY3",
                             number: 29302,
                             title: "build: simplify, inline tool version recording",
                             user: user,
                             labels: [],
                             state: "open",
                             locked: false,
                             assignee: nil,
                             assignees: [],
                             milestone: nil,
                             comments: 2,
                             createdAt: "2020-01-18T18:23:46Z",
                             updatedAt: "2020-01-18T18:24:05Z",
                             closedAt: nil,
                             authorAssociation: "COLLABORATOR",
                             pullRequest: pullRequest,
                             body: "This simplifies and inlines the version recording for the tools in use.\r\n\r\n<!-- What's in this pull request? -->\r\nReplace this paragraph with a description of your changes and rationale. Provide links to external references/discussions if appropriate.\r\n\r\n<!-- If this pull request resolves any bugs in the Swift bug tracker, provide a link: -->\r\nResolves SR-NNNN.\r\n\r\n<!--\r\nBefore merging this pull request, you must run the Swift continuous integration tests.\r\nFor information about triggering CI builds via @swift-ci, see:\r\nhttps://github.com/apple/swift/blob/master/docs/ContinuousIntegration.md#swift-ci\r\n\r\nThank you for your contribution to Swift!\r\n-->\r\n")
    }
}
