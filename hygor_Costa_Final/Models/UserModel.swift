


import Foundation

//MARK: User Model
struct User: Identifiable, Codable {
  let id: Int
  let username: String
  let type: String
  let avatarUrl: String
  let userUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case username = "login"
        case type
        case avatarUrl = "avatar_url"
        case userUrl = "url"
    }
}

let testUser = User(id: 2958498939, username: " papacharlipapa", type: "User", avatarUrl: "https://avatars.githubusercontent.com/u/6900718?v=4", userUrl: "https://api.github.com/users/mojombo")

let testUsers = [
    User(id: 2958489439, username: " papacharlipapa", type: "User", avatarUrl: "https://avatars.githubusercontent.com/u/6900718?v=4", userUrl: "https://api.github.com/users/mojombo"),
    User(id: 2984498939, username: " papacharlipapa", type: "User", avatarUrl: "https://avatars.githubusercontent.com/u/6900718?v=4", userUrl: "https://api.github.com/users/mojombo"),
    User(id: 2945849893, username: " papacharlipapa", type: "User", avatarUrl: "https://avatars.githubusercontent.com/u/6900718?v=4", userUrl: "https://api.github.com/users/mojombo"),
    User(id: 2954989439, username: " papacharlipapa", type: "User", avatarUrl: "https://avatars.githubusercontent.com/u/6900718?v=4", userUrl: "https://api.github.com/users/mojombo"),
    User(id: 295849899, username: " papacharlipapa", type: "User", avatarUrl: "https://avatars.githubusercontent.com/u/6900718?v=4", userUrl: "https://api.github.com/users/mojombo")
]


