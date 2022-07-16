//
//  HeroesCollectionViewController.swift
//  RickAndMorty
//
//  Created by Вячеслав Кремнев on 09.07.2022.
//

import UIKit

private let reuseIdentifier = "hero"

class HeroesCollectionViewController: UICollectionViewController {

    private var rickAndMorty: RickAndMorty?
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.url.rawValue)
        
        
        collectionView.backgroundColor = .black
        
        
         self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return rickAndMorty?.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .black
        cell.heroInfoLabel.backgroundColor = .black
        
        
        let character = rickAndMorty?.results[indexPath.row]
        cell.configure(with: character)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchHeroes(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.collectionView.reloadData()
        }
    }
}
