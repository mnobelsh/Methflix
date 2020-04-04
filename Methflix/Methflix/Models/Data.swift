//
//  Data.swift
//  Methflix
//
//  Created by Muhammad Nobel Shidqi on 04/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import Foundation


struct MovieData: Codable {
    let results: [Results]
}

struct Results: Codable {
    let id: Int
    let popularity: Double
    let poster_path: String
    let backdrop_path: String
    let original_title: String
    let genre_ids: [Int]
    let vote_average: Double
    let overview: String
    let release_date: String
}


