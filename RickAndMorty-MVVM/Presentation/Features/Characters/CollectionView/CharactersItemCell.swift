//
//  CharactersItemCell.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 06/06/23.
//

import UIKit

class CharactersItemCell: UICollectionViewCell {
    static let identifier = "CharactersItemCell"
    
    @IBOutlet var card: UIView!
    @IBOutlet var shadow: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var species: UILabel!
    @IBOutlet var originName: UILabel!
    @IBOutlet var image: UIImageView!
    
    var item: CharactersModelPresentation? = nil
    func configure(item: CharactersModelPresentation) {
        self.item = item
        
        name.text = item.name
        status.text = item.status
        species.text = item.species
        originName.text = item.originName
        image.image = nil
        image.roundCorners()
        image.startShimmering()
        image.load(url: item.image) {
            self.image.roundCorners()
            self.image.stopShimmering()
        }
        
        
        card.roundCorners()
        shadow.addShadow()
    }
    
    
    
    
    
    
    
    
    
}
