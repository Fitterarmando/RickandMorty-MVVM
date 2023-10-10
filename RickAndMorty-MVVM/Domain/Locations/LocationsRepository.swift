//
//  LocationsRepository.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import Foundation

protocol LocationsRepository {
    func getLocations(completion: @escaping (Result<[LocationsModelDomain], ApiError>) -> Void)
}
