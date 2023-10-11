//
//  LocationsVC.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 08/06/23.
//

import UIKit
import Resolver
import Combine

class LocationsVC : UIViewController {
    @Injected var  locationsRepository : LocationsRepository
    
    @IBOutlet var locationsCollectionView: LocationsCollectionView!
    @IBOutlet var emptyState: UIScrollView!
    @IBOutlet var emptyStateImage: UIImageView!
    @IBOutlet var emptyStateText: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel = LocationsViewModel()
    private var anyCancellable : [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscriptions()
        
        emptyState.isHidden = true
        locationsCollectionView.isHidden = true
        
        locationsCollectionView.register(UINib(nibName: LocationsItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: LocationsItemCell.identifier)
        locationsCollectionView.dataSource = locationsCollectionView
        locationsCollectionView.delegate = locationsCollectionView
        
        updateLocations()
        configureRefreshControl()
        
       
    }
    
    private func subscriptions() {
        viewModel.locationList.sink {_ in} receiveValue: { locations in
            if locations.isEmpty {
                self.setEmptyState(imageName: "Error2", errorDescription: "Vuelve intentar mas tarde")
            } else {
                self.setCollectionView(locations: locations)
            }
        }.store(in: &anyCancellable)
        
        viewModel.loading.sink {_ in} receiveValue: { loading in
            if loading {
                self.activityIndicator.startAnimating()
                self.activityIndicator.isHidden = false
            } else {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.emptyState.refreshControl?.endRefreshing()
                self.locationsCollectionView.refreshControl?.endRefreshing()
            }
        }.store(in: &anyCancellable)
    }
    
    private func setCollectionView (locations : [LocationsModelPresentation]) {
        locationsCollectionView.isHidden = false
        emptyState.isHidden = true
        locationsCollectionView.collectionLocations = locations
        locationsCollectionView.reloadData()
    }
    
    private func setEmptyState (imageName: String, errorDescription : String) {
        locationsCollectionView.isHidden = true
        emptyState.isHidden = false
        
        emptyStateImage.image = UIImage(named: imageName)
        emptyStateText.text = errorDescription
    }
    
    func configureRefreshControl() {
        locationsCollectionView.refreshControl = UIRefreshControl()
        locationsCollectionView.refreshControl?.addTarget(self, action: #selector(updateLocations), for: .valueChanged)
        
        emptyState.refreshControl = UIRefreshControl()
        emptyState.refreshControl?.addTarget(self, action: #selector(updateLocations), for: .valueChanged)
    }
    
    @objc func updateLocations() {
        viewModel.getLocations()
    }
    
}
