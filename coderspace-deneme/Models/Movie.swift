//
//  File.swift
//  coderspace-deneme
//
//  Created by ANIL GULGOR on 8.05.2024.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let year: Int
    let director: String
    let coverImageUrl: String
}

struct MoviesResponse: Decodable {
    let movies: [Movie]
}
