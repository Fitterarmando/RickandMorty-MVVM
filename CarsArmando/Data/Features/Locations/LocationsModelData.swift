//
//  LocationsModelData.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import Foundation

struct LocationsModelData : Codable {
    let info : InfoLocations
    let results : [Results]
}

struct InfoLocations : Codable {
    let count : Int
    let pages : Int
    let next : String
    let prev : String?
}

struct Results : Codable {
    let id : Int
    let name : String
    let type : String
    let dimension : String
    let residents : [String]
    let url : String
    let created : String
    
}

extension Results {
    func toDomain() -> LocationsModelDomain {
        return LocationsModelDomain(
            name: self.name,
            type: self.type,
            dimension: self.dimension,
            resindents: self.residents
        )
    }
}
