//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Вячеслав Кремнев on 08.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var detailHeroImage: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailStatusLabel: UILabel!
    @IBOutlet weak var detailSpeciesLabel: UILabel!
    @IBOutlet weak var detailGenderLabel: UILabel!
    
    var hero: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            guard let image = NetworkManager.shared.fetchImage(url: self.hero.image) else {return}
            
            DispatchQueue.main.async {
                self.detailHeroImage.image = UIImage(data: image)
                self.detailNameLabel.text = self.hero.name
                self.detailStatusLabel.text = self.hero.status
                self.detailSpeciesLabel.text = self.hero.species
                self.detailGenderLabel.text = self.hero.gender
            }
        }
    }
}

