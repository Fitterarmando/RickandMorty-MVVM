//
//  CharactersApi.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 27/04/23.
//

import Foundation
import Alamofire

struct CharactersApi {
    private let apiManager : APIManager
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getCharacters(completion: @escaping(Result<CharactersModelData, ApiError>) -> Void) {
        let request = Request(method: .get, path: "/character")
        apiManager.request(urlRequest: request) { (result: Swift.Result<CharactersModelData, ApiError>) in completion(result)
       
        }
    }
}
