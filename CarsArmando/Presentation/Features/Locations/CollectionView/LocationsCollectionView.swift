//
//  LocationsCollectionView.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import UIKit

class LocationsCollectionView : UICollectionView {
    var collectionLocations : [LocationsModelPresentation] = []
    var onTap: (LocationsModelPresentation) -> Void = { charaters in }
    
    }
    
extension LocationsCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
}

extension LocationsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionLocations.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsItemCell.identifier, for: indexPath) as! LocationsItemCell
        let index = indexPath.item
        cell.configure(item: collectionLocations[index])
        return cell
    }
}


