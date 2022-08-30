//
//  CollectionViewCell.swift
//  RickAndMorty
//
//  Created by Вячеслав Кремнев on 09.07.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var heroInfoLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    {
        didSet {
            heroImage.layer.cornerRadius = heroImage.frame.width / 2
        }
    }
    
    
    func configure(with character: Character?) {
        heroInfoLabel.text = character?.name
        
        DispatchQueue.global().async {
            guard let stringUrl = character?.image else {return}
            guard let url = URL(string: stringUrl) else {return}
            guard let dataImage = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.async {
                self.heroImage.image = UIImage(data: dataImage)
            }
        }
    }
}
