//
//  RickAndMortyRepositoryImpl.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 25/04/23.
//

import Foundation
import Alamofire

class RickAndMortyRepositoryImpl : EpisodesRepository, CharacterRepository, LocationsRepository {
    
    private let episodesApi: EpisodesApi
    private let charactersApi : CharactersApi
    private let locationsApi : LocationsApi
    
    init(episodesApi : EpisodesApi, charactersApi : CharactersApi, locationsApi : LocationsApi){
        self.episodesApi = episodesApi
        self.charactersApi = charactersApi
        self.locationsApi = locationsApi
    }
    
    func getEpisodes(completion: @escaping (Result<[EpisodesModelDomain], ApiError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.episodesApi.getEpisodes { result in
                switch result {
                case.success(let response):
                    completion(.success(response.results.map { value in value.toDomain() }))
                case.failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    func getCharacters(completion: @escaping (Result<[CharacterModelDomain], ApiError>) -> Void) {
        charactersApi.getCharacters { result in
            switch result {
            case.success(let response):
                completion(.success(response.results.map { value in value.toDomain() }))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getLocations(completion: @escaping (Result<[LocationsModelDomain], ApiError>) -> Void) {
        locationsApi.getLocations { result in
            switch result {
            case.success(let response):
                completion(.success(response.results.map { value in value.toDomain() }))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}

