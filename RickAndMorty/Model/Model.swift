//
//  Model.swift
//  RickAndMorty
//
//  Created by Вячеслав Кремнев on 08.07.2022.
//

import Foundation

struct RickAndMorty: Decodable{
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let episode: [String?]
}

struct Episode: Decodable {
    let name: String
    let date: String
    let episode: String
    let characters: [String]
}

enum Link: String {
    case url = "https://rickandmortyapi.com/api/character"
}
