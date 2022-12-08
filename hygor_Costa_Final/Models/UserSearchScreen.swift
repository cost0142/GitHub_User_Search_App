//
//  UserSearchDeatils.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-12-08.
//

import Foundation

struct UserSearchScreen: Identifiable, Codable {
    
    let name: String
    let location: String
    let company: String
    let followers: Int
    let publicGists: Int
    let upDated: String
    let createdata: String
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case location
        case company
        case followers
        case publicGists = "public_gists"
        case upDated = "updated_at"
        case createdata = "created_at"
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
