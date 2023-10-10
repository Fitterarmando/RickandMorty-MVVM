//
//  CharactersModelData.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 27/04/23.
//

import Foundation

struct CharactersModelData : Codable  {
    let info : InfoCharacters
    let results : [ResultsCharacters]
    
}

struct InfoCharacters : Codable {
    let count : Int
    let pages : Int
    let next : String
    let prev : String?
}

struct ResultsCharacters : Codable {
    let id : Int
    let name : String
    let status : String
    let species : String
    let type : String
    let gender : String
    let origin : Origin
    let location : Location
    let image : String
    let episode : [String]
    let url : String
    let created : String 
}

struct Origin : Codable {
    let name : String
    let url : String
}

struct Location : Codable {
    let name: String
    let url : String
}


extension ResultsCharacters {
    func toDomain() -> CharacterModelDomain {
        return CharacterModelDomain(
            id: self.id,
            name: self.name,
            status: self.status,
            species: self.species,
            gender: self.gender,
            image: self.image
        )
    }
    
}
