//
//  CharactersCollectionView.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 06/06/23.
//

import UIKit

class CharactersCollectionView : UICollectionView {
    var collectionCharacters : [CharactersModelPresentation] = []
    var onTap: (CharactersModelPresentation) -> Void = { charaters in }
    
    }
    
extension CharactersCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 200)
    }
}

extension CharactersCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionCharacters.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersItemCell.identifier, for: indexPath) as! CharactersItemCell
        let index = indexPath.item
        cell.configure(item: collectionCharacters[index])
        return cell
    }
}

