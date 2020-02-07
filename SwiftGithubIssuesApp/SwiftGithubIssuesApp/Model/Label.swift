//
//  Label.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 07/02/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

// MARK: - Label
struct Label: Codable {
    let id: Int
    let nodeID: String
    let url: String
    let name, labelDescription, color: String
    let labelDefault: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url, name
        case labelDescription = "description"
        case color
        case labelDefault = "default"
    }
}
