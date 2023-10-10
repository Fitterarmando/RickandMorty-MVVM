//
//  LocationsApi.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import Foundation
import Alamofire

struct LocationsApi {
    private let apiManager : APIManager
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getLocations(completion: @escaping(Result<LocationsModelData, ApiError>) -> Void) {
        let request = Request(method: .get, path: "/location")
    apiManager.request(urlRequest: request) { (result: Swift.Result<LocationsModelData, ApiError>) in completion(result)
        }
    }
    
}
