//
//  EpisodesModelData.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 25/04/23.
//

import Foundation

struct EpisodesModelData : Codable {
    let info : InfoEpisodes
    let results : [Episode]
}

struct InfoEpisodes : Codable {
    let count : Int
    let pages : Int
    let next : String
    let prev : String?
}

struct Episode : Codable {
    let id : Int
    let name : String
    let airDate : String
    let episode : String
    let characters : [String]
    let url : String
    let created : String
}

extension Episode {
    func toDomain() -> EpisodesModelDomain {
        return EpisodesModelDomain(
            name: self.name,
            airDate: self.airDate,
            episode: self.episode
        )
    }
}
