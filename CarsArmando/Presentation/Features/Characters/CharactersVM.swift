//
//  CharactersVM.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 10/10/23.
//

import Foundation
import Combine
import Resolver


final class CharactersVM {
    @Injected var charactersRepository : CharacterRepository
    
    var charactersList = PassthroughSubject <[CharactersModelPresentation], Error>()
    var loading = PassthroughSubject <Bool, Error>()
    
    func getCharactersList() {
        self.loading.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.charactersRepository.getCharacters() { result in
                switch result {
                case.success(let characters):
                    self.charactersList.send(characters.map { $0.toPresentation() })
                case .failure(_):
                    self.charactersList.send([])
                }
                self.loading.send(false)
            }
        }
    }
}
