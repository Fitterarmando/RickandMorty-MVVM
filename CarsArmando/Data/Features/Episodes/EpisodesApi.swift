//
//  RickAndMortyApi.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 25/04/23.
//

import Foundation
import Alamofire

struct EpisodesApi {
    private let apiManager : APIManager
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getEpisodes(completion: @escaping(Result<EpisodesModelData, ApiError>) -> Void) {
        let request = Request(method: .get, path: "/episode")
        apiManager.request(urlRequest: request) { (result: Swift.Result<EpisodesModelData, ApiError>) in completion(result)
        }
    }
    
}
