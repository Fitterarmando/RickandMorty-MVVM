//
//  ViewController.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 20/04/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet var titleRickAndMorty: UIImageView!
    @IBOutlet var rickMorty1: UIImageView!
    @IBAction func episodes(_ sender: Any) {
        navigationController?.pushViewController(EpisodesVC(), animated: true)
    }
    @IBAction func characters(_ sender: Any) {
        navigationController?.pushViewController(CharactersVC(), animated: true)
    }
  
    @IBAction func locations(_ sender: Any) {
        navigationController?.pushViewController(LocationsVC(), animated: true)
    }
    
    
    @IBOutlet var home: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        navigationItem.title = "Rick and Morty"
        // Do any additional setup after loading the view.
    }


}

