import Foundation

struct GithubUser: Decodable {
    let id: Int
    let login: String
    let avatar_url: String?
    let name: String?
    let email: String?
    let bio: String?
    let followers: Int
    let following: Int
}
