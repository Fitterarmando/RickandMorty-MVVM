//
//  EpisodesItemCell.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 24/04/23.
//

import UIKit

class EpisodesItemCell: UICollectionViewCell {
    static let identifier = "EpisodesItemCell"
    
    @IBOutlet var shadow: UIView!
    @IBOutlet var card: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var air_date: UILabel!
    @IBOutlet var episode: UILabel!
    
    var item: EpisodesModelPresentation? = nil
    func configure(item: EpisodesModelPresentation) {
        self.item = item
        
        name.text = item.name
        air_date.text = item.airDate
        episode.text = item.episode
        
        card.roundCorners()
        shadow.addShadow()
    }
    
}
