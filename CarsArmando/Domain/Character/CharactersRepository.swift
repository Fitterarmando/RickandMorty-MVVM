//
//  CharactersRepository.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 26/04/23.
//

import Foundation

protocol CharacterRepository {
    func getCharacters(completion: @escaping (Result<[CharacterModelDomain], ApiError>) -> Void)
}
