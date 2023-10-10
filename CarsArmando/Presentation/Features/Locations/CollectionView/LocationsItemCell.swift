//
//  LocationsItemCell.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import UIKit

class LocationsItemCell: UICollectionViewCell {
    static let identifier = "LocationsItemCell"
    
    @IBOutlet var shadow: UIView!
    @IBOutlet var card: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var dimension: UILabel!
    @IBOutlet var residents: UILabel!
    @IBOutlet var image: UIImageView!
    
    var item: LocationsModelPresentation? = nil
    func configure(item: LocationsModelPresentation) {
        self.item = item
        
        name.text = item.name
        type.text = item.type
        dimension.text = item.dimension
        residents.text = item.residents.joined()
        
        shadow.addShadow()
        card.roundCorners()
    }
    
}

