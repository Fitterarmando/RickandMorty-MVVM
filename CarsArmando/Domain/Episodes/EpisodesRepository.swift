//
//  EpisodesRepository.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 25/04/23.
//

import Foundation

protocol EpisodesRepository {
    func getEpisodes(completion: @escaping (Result<[EpisodesModelDomain], ApiError>) -> Void)
}
