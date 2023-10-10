//
//  CharactersModelPresentation.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 06/06/23.
//

import Foundation

struct CharactersModelPresentation {
    let name: String
    let status: String
    let species: String
    let originName: String
    let image: String
}

extension CharacterModelDomain {
    func toPresentation () -> CharactersModelPresentation {
        return CharactersModelPresentation(
            name: self.name,
            status: self.status,
            species: self.species,
            originName: self.name,
            image: self.image)
    }
}
