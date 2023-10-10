//
//  EpisodesModelPresentation.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 25/04/23.
//

import Foundation

struct EpisodesModelPresentation {
    let name: String
    let airDate: String
    let episode: String
}

extension EpisodesModelDomain {
    func toPresentation () -> EpisodesModelPresentation {
        return EpisodesModelPresentation(
            name: self.name,
            airDate: self.airDate,
            episode: self.episode)
    }
}


