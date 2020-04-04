//
//  MovieTableViewCell.swift
//  Methflix
//
//  Created by Muhammad Nobel Shidqi on 03/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    var data: [Movie]!

    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionType: MovieCollectionType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - Collection View Datasource & Delegate
extension MovieTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionCellIdentifier, for: indexPath) as! MovieCollectionViewCell
//        cell.moviePoster.image = UIImage(named: data[indexPath.row].image)
//        cell.movieId = data[indexPath.row].id
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(data[indexPath.row].title)
    }
    
}
