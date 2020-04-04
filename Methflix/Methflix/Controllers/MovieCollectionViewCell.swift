//
//  MovieCollectionViewCell.swift
//  Methflix
//
//  Created by Muhammad Nobel Shidqi on 03/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

enum MovieCollectionType {
    case normal
    case preview
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    var movieId: String?

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    
}
