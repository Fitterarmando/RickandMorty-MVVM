//
//  EpisodesVC.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 24/04/23.
//

import UIKit
import Resolver
import Combine


class EpisodesVC : UIViewController {
    
    @IBOutlet weak var episodesCollectionView: EpisodesCollectionView!
    @IBOutlet var episodesVC: UIView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var emptyState: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var error: UIImageView!
    @IBOutlet var errorText: UILabel!
    
    private let viewModel = EpisodesVM()
    private var anyCancellable : [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscriptions()
        
        scrollView.isHidden = true
        episodesCollectionView.isHidden = true
        
        episodesCollectionView.register(UINib(nibName: EpisodesItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: EpisodesItemCell.identifier)
        episodesCollectionView.dataSource = episodesCollectionView
        episodesCollectionView.delegate = episodesCollectionView
    
        updateEpisodes()
        configureRefreshControl()
        
    }
    
    private func subscriptions() {
        viewModel.episodesList.sink { _ in} receiveValue: { episodes in
            if episodes.isEmpty {
                self.setEmptyState(imageName: "Error", errorDescription: "No hay contenido en este momento.")
            } else {
                self.setCollectionView(episodes: episodes)
            }
        }.store(in: &anyCancellable)
        
        viewModel.loading.sink { _ in} receiveValue: { loading in
            if loading {
                self.activityIndicator.startAnimating()
                self.activityIndicator.isHidden = false
            } else {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.scrollView.refreshControl?.endRefreshing()
                self.episodesCollectionView.refreshControl?.endRefreshing()
            }

        }.store(in: &anyCancellable)
    }

    private func setCollectionView (episodes: [EpisodesModelPresentation])  {
        episodesCollectionView.isHidden = false
        scrollView.isHidden = true
        episodesCollectionView.collectionEpisodes = episodes
        episodesCollectionView.reloadData()
    }
    
    private func setEmptyState (imageName: String, errorDescription: String ) {
        episodesCollectionView.isHidden = true
        scrollView.isHidden = false
        
        error.image = UIImage(named: imageName)
        self.errorText.text = errorDescription
        
    }
    
    func configureRefreshControl () {
        episodesCollectionView.refreshControl = UIRefreshControl()
        episodesCollectionView.refreshControl?.addTarget(self, action: #selector(updateEpisodes), for: .valueChanged)
        
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action:
                                                #selector(updateEpisodes),
                                             for: .valueChanged)
    }
    
    @objc func updateEpisodes () {
        viewModel.getEpisodesList()
    }
}



