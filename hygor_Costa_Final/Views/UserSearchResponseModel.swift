//
//  UserSearchResponseModel.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-12-01.
//

import Foundation

struct UserSearchResponseModel: Codable {
let totalCount: Int
let incompleteResults: Bool
    let users: [User]
    
enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case incompleteResults = "incomplete_results"
    case users = "items"
}
}

