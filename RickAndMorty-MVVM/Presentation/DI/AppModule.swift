//
//  AppModule.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 26/04/23.
//

import Foundation
import Alamofire
import Resolver

/*
let interceptor: RequestInterceptor? = nil
let session = Session(interceptor: interceptor)
let api = APIManager(sessionManager: session)

let episodesApi = EpisodesApi(apiManager: api)
let charactersApi = CharactersApi(apiManager: api)

let repository = RickAndMortyRepositoryImpl(
    episodesApi: episodesApi,
    charactersApi: charactersApi
)
*/

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        register { LocationsViewModel() }
        
        register { RequestInterceptor() }.implements(Alamofire.RequestInterceptor.self)
        register { Session(interceptor: optional()) }
        register { APIManager(sessionManager: resolve()) }
      
        register { EpisodesApi(apiManager: resolve()) }
        register { CharactersApi(apiManager: resolve())}
        register { LocationsApi(apiManager: resolve())}
        
        register { RickAndMortyRepositoryImpl(episodesApi: resolve(), charactersApi: resolve(), locationsApi: resolve()) }.implements(EpisodesRepository.self)
        register { RickAndMortyRepositoryImpl(episodesApi: resolve(), charactersApi: resolve(), locationsApi: resolve()) }.implements(CharacterRepository.self)
        register { RickAndMortyRepositoryImpl(episodesApi: resolve(), charactersApi: resolve(), locationsApi: resolve()) }.implements(LocationsRepository.self)



    }
}
