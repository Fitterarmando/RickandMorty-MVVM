//
//  EpisodesCollectionView.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 24/04/23.
//

import UIKit

class EpisodesCollectionView : UICollectionView {
    var collectionEpisodes : [EpisodesModelPresentation] = []
    
    
    }
    
extension EpisodesCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
}

extension EpisodesCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionEpisodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesItemCell.identifier, for: indexPath) as! EpisodesItemCell
        let index = indexPath.item
        cell.configure(item: collectionEpisodes[index])
        return cell
    }
}
