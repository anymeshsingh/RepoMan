import Foundation

struct GithubRepo: Codable {
    var id: Int
    var name: String
    var full_name: String
    var isPrivate: Bool
    var description: String?
    var fork: Bool
    var ssh_url: String
    var clone_url: String
    var language: String?
    var open_issues_count: Int
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case full_name
        case isPrivate = "private"
        case description
        case fork
        case ssh_url
        case clone_url
        case language
        case open_issues_count
    }
}
