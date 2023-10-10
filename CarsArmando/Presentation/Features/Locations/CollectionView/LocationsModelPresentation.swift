//
//  LocationsModelPresentation.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import Foundation

struct LocationsModelPresentation {
    let name : String
    let type : String
    let dimension : String
    let residents : [String]
}

extension LocationsModelDomain {
    func toPresentation () -> LocationsModelPresentation {
        return LocationsModelPresentation(
            name: self.name,
            type: self.type,
            dimension: self.dimension,
            residents: self.resindents)
    }
}
