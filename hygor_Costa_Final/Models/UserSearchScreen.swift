//
//  UserSearchDeatils.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-12-08.
//

import Foundation

struct UserDetails: Identifiable, Codable {
    let id: Int
    let username: String
    let avatarUrl: String
    let userUrl: String
    let location: String?
    let company: String?
    let followers: Int
    let gists: Int
    let repos: Int
    let lastUpdated: String
    let createdAt: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case username = "login"
        case avatarUrl = "avatar_url"
        case userUrl = "html_url"
        case location = "location"
        case company = "company"
        case followers = "followers"
        case gists = "public_gists"
        case repos = "public_repos"
        case lastUpdated = "updated_at"
        case createdAt = "created_at"
        
    }
}

//{
//    "login": "nice",
//    "id": 2760100,
//    "node_id": "MDQ6VXNlcjI3NjAxMDA=",
//    "avatar_url": "https://avatars.githubusercontent.com/u/2760100?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/nice",
//    "html_url": "https://github.com/nice",
//    "followers_url": "https://api.github.com/users/nice/followers",
//    "following_url": "https://api.github.com/users/nice/following{/other_user}",
//    "gists_url": "https://api.github.com/users/nice/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/nice/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/nice/subscriptions",
//    "organizations_url": "https://api.github.com/users/nice/orgs",
//    "repos_url": "https://api.github.com/users/nice/repos",
//    "events_url": "https://api.github.com/users/nice/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/nice/received_events",
//    "type": "User",
//    "site_admin": false,
//    "name": "Jayaram R",
//    "company": null,
//    "blog": "",
//    "location": "India",
//    "email": null,
//    "hireable": null,
//    "bio": null,
//    "twitter_username": null,
//    "public_repos": 43,
//    "public_gists": 22,
//    "followers": 18,
//    "following": 21,
//    "created_at": "2012-11-09T16:01:27Z",
//    "updated_at": "2022-12-03T04:24:46Z"
//}
