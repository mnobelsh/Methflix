//
//  DataModel.swift
//  Methflix
//
//  Created by Muhammad Nobel Shidqi on 04/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import Foundation

struct Movies {
    private var collectionType: MovieCategoryListType
    var movies: [Movie]
    var collectionTitle: String
    
    init(collectionType: MovieCategoryListType, movies: [Movie]) {
        self.collectionType = collectionType
        switch collectionType {
            case .popular:
                self.collectionTitle = "Popular"
            case .now_playing:
                self.collectionTitle = "Now Playing"
            case .top_rated:
                self.collectionTitle = "Top Rated"
        }
        self.movies = movies
    }
    
}

struct Movie {
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
