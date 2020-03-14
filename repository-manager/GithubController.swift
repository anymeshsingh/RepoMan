//
//  GithubController.swift
//  repository-manager
//
//  Created by Animesh Singh on 29/02/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import Foundation
import Alamofire

class GithubController {
    
    var user: GithubUser?
    var repos: [GithubRepo]?
    
    func fetchUserDetails(token: String, completion: @escaping (Result<GithubUser, Error>) -> ()) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Token \(token)",
        ]
        
        AF.request(Constants.URL_GITHUB_USER, headers: headers).responseData { (response) in
            if (response.error != nil) {
                completion(.failure(response.error!))
            }
            do {
                let user = try JSONDecoder().decode(GithubUser.self, from: response.data!)
                self.user = user
                completion(.success(user))
                return
            } catch let jsonError {
                completion(.failure(jsonError))
                return
            }
        }
    }
    
    func fetchUserRepos(token: String, completion: @escaping (Result<[GithubRepo], Error>) -> ()) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Token \(token)",
        ]
        
        AF.request(Constants.URL_GITHUB_USER_REPOS, headers: headers).responseData { (response) in
            if (response.error != nil) {
                completion(.failure(response.error!))
            }
            do {
                let repos = try JSONDecoder().decode([GithubRepo].self, from: response.data!)
                self.repos = repos
//                print(repos)
                completion(.success(repos))
                return
            } catch let jsonError {
                completion(.failure(jsonError))
                return
            }
        }
    }
    
}
