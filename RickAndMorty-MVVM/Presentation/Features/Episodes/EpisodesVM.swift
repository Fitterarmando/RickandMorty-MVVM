//
//  EpisodesVM.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 06/10/23.
//

import Foundation
import Combine
import Resolver

final class EpisodesVM {
    @Injected var episodeRepository : EpisodesRepository
    
    var episodesList = PassthroughSubject <[EpisodesModelPresentation], Error>()
    var loading = PassthroughSubject <Bool, Error>()
    //@Published var errorMessage: String?
   // @Published var emptyMessage: String?
    
    func getEpisodesList() {
        self.loading.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.episodeRepository.getEpisodes() { result in
                switch result {
                case.success(let episodes):
                    self.loading.send(false)
                    self.episodesList.send(episodes.map { $0.toPresentation() })
                case .failure(_):
                    self.episodesList.send([])
                }
            }
        }
    }
}


