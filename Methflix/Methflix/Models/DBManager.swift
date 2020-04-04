//
//  DBManager.swift
//  Methflix
//
//  Created by Muhammad Nobel Shidqi on 04/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import Foundation

enum MovieCategoryListType: String {
    case popular
    case top_rated
    case now_playing
}

protocol DBManagerDelegate {
    func didUpdateMovie(data: Movies)
}

struct DBManager {
    
    private let url = K.apiUrl
    private let apikey = K.apikey
    var delegate: DBManagerDelegate?
    
    
    func fetchMovies(by category: MovieCategoryListType? = .now_playing) {
        let categoryString = category!.rawValue
        let baseUrlString = "\(url)\(categoryString)?api_key=\(self.apikey)&language=en-US&page=1"
        if let urlString = baseUrlString.removingPercentEncoding, let baseUrl = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: baseUrl) { (data, response, error) in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    if let jsonData = data {
                        if let data = self.parseJSON(jsonData, to: category!) {
                            self.delegate?.didUpdateMovie(data: data)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchMovieAssets() {
        
    }
    

    private func parseJSON(_ json: Data, to selectedCategory: MovieCategoryListType) -> Movies?{
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(MovieData.self, from: json)
            var movies: [Movie] = []
            for m in result.results {
                let movie = Movie(id: m.id, popularity: m.popularity, poster_path: m.poster_path, backdrop_path: m.backdrop_path, original_title: m.original_title, genre_ids: m.genre_ids, vote_average: m.vote_average, overview: m.overview, release_date: m.release_date)
                movies.append(movie)
            }
            return Movies(collectionType: selectedCategory, movies: movies)

        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    

    
    
}
