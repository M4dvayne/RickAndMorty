//
//  HeroesCollectionViewController.swift
//  RickAndMorty
//
//  Created by Вячеслав Кремнев on 09.07.2022.
//

import UIKit

class HeroesCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "hero"
    private var rickAndMorty: RickAndMorty?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.url.rawValue)
        collectionView.backgroundColor = .black
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.reloadData()
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?[0] else {return}
        guard let detailVC = segue.destination as? ViewController else {return}
        let hero = rickAndMorty?.results[indexPath.row]
        detailVC.hero = hero
    }
    
    
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
    
    
    private func setupNavigationBar() {
        
        title = "Rick & Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Navigation bar appearance
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .black
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchHeroes(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.collectionView.reloadData()
        }
    }
}
