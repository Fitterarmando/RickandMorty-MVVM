//
//  LocationsViewModel.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 09/06/23.
//

import Foundation
import Resolver
import Combine

public class LocationsViewModel {
    @Injected var locationsRepository : LocationsRepository

    var locationList = PassthroughSubject <[LocationsModelPresentation], Error>()
    var loading = PassthroughSubject <Bool, Error>()

    func getLocations() {
        self.loading.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.locationsRepository.getLocations() { result in
                switch result {
                case.success(let locations):
                    self.locationList.send(locations.map { $0.toPresentation() })
                case .failure(_):
                    self.locationList.send([])
                }
                self.loading.send(false)
            }
        }
    }
}
