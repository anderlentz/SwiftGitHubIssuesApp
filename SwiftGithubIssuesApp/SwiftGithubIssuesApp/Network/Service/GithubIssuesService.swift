//
//  GithubIssuesService.swift
//  SwiftGithubIssuesApp
//
//  Created by Anderson on 18/01/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Moya

class GithubIssuesService: GithubIssuesServiceProtocol {
    
    let provider = MoyaProvider<GithubIssuesApi>()
    
    func getIssues(page: Int, completion: @escaping (Result<[Issue], Error>) -> Void) {
        
        print("Get issues ------- \n")
       
        provider.request(.issues(page: page)) { (result) in
            switch result {
            case .success(let response):
                print("Response: \(response)")
                do {
                    let results = try JSONDecoder().decode(Issue.self, from: response.data)
                    print("SUCESSO")
                    print(results)
                    
                    //completion(.success(results))
                } catch let err {
                    print("ERRO")
                    print(err)
                    completion(.failure(err))
                    
                }
            case .failure(let error):
                print("ERROR MOYA")
                completion(.failure(error))
            }
        }
    }
    
    
}
