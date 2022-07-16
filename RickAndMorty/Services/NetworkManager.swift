//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Вячеслав Кремнев on 08.07.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchHeroes(from url: String?, with completion: @escaping(RickAndMorty) -> Void) {
        
        guard let stringUrl = url else {return}
        guard let requestUrl = URL(string: stringUrl) else {return}
        
        URLSession.shared.dataTask(with: requestUrl) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return}
            print(data)
            
            do{
                let receivedData = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    completion(receivedData)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchImage(url: String?) -> Data? {
        
        guard let stringUrl = url else {return nil}
        guard let imageURL = URL(string: stringUrl) else {return nil}
        return try? Data(contentsOf: imageURL)
        
        
    }
}

