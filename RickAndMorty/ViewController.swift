//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Вячеслав Кремнев on 08.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                print("111")
    }
    
    @IBAction func getJSON(_ sender: Any) {
        NetworkManager.shared.fetchHeroes(from: Link.url.rawValue) { heroes in
            print(heroes)
        }
    }
}

