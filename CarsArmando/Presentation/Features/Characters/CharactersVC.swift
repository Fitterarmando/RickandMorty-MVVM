//
//  CharactersVC.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 06/06/23.
//

import UIKit
import Resolver
import Combine

class CharactersVC : UIViewController {
    @Injected var charactersRepository : CharacterRepository
    
    @IBOutlet weak var charactersCollectionView: CharactersCollectionView!
    @IBOutlet var charactersVC: UIView!
    @IBOutlet var emptyState: UIScrollView!
    @IBOutlet var emptyStateImage: UIImageView!
    @IBOutlet var emptyStateText: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel = CharactersVM()
    private var anyCancellable : [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscriptions()
        
        emptyState.isHidden = true
        charactersCollectionView.isHidden = true
        
        charactersCollectionView.register(UINib(nibName: CharactersItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CharactersItemCell.identifier)
        charactersCollectionView.dataSource = charactersCollectionView
        charactersCollectionView.delegate = charactersCollectionView
        
        updateCharacters()
        configureRefreshControl()
        
    }
    
    private func subscriptions() {
        viewModel.charactersList.sink {_ in} receiveValue: { characters in
            if characters.isEmpty {
                self.setEmptyState(imageName: "Error2", errorDescription: "Intentalo nuevamente")
            } else {
                self.setCollectionView(characters: characters)
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
                self.charactersCollectionView.refreshControl?.endRefreshing()
            }
        }.store(in: &anyCancellable)
    }
    
    private func setCollectionView (characters : [CharactersModelPresentation]) {
        charactersCollectionView.isHidden = false
        emptyState.isHidden = true
        charactersCollectionView.collectionCharacters = characters
        charactersCollectionView.reloadData()
    }
    
    private func setEmptyState (imageName:String, errorDescription:String) {
        charactersCollectionView.isHidden = true
        emptyState.isHidden = false
        
        emptyStateImage.image = UIImage(named: imageName)
        self.emptyStateText.text = errorDescription
        
    }
    
    func configureRefreshControl() {
        charactersCollectionView.refreshControl = UIRefreshControl()
        charactersCollectionView.refreshControl?.addTarget(self, action: #selector(updateCharacters), for: .valueChanged)
        
        emptyState.refreshControl = UIRefreshControl()
        emptyState.refreshControl?.addTarget(self, action: #selector(updateCharacters), for: .valueChanged)
    }
    
    @objc func updateCharacters() {
        viewModel.getCharactersList()
    }
}
