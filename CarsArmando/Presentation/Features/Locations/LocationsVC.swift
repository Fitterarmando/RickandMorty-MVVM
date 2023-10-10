//
//  LocationsVC.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import UIKit
import Resolver

class LocationsVC : UIViewController {
    @Injected var viewModel: LocationsViewModel
    
    @IBOutlet var locationsCollectionView: LocationsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getLocations()
        
        viewModel.locationsUiState.bind { [weak self] locations in
            let locationsModelPresentation = locations
            self?.locationsCollectionView.collectionLocations = locationsModelPresentation
            self?.locationsCollectionView.reloadData()
        }
        
        viewModel.loadingUiState.bind { [weak self] loading in
            // loadingView.isHidden = !loading
        }
        
        locationsCollectionView.register(UINib(nibName: LocationsItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: LocationsItemCell.identifier)
        locationsCollectionView.dataSource = locationsCollectionView
        locationsCollectionView.delegate = locationsCollectionView
        
    }
}
