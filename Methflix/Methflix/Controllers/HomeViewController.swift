//
//  HoneViewController.swift
//  Methflix
//
//  Created by Muhammad Nobel Shidqi on 03/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

//struct MovieList {
//    let category: String
//    let movies: [Movie]
//}
//
//struct Movie {
//    let title: String
//    let image: String
//    let id: String
//}


class HomeViewController: UIViewController, DBManagerDelegate {

    

    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var headerPlayButton: UIButton!
    @IBOutlet weak var myListImage: UIImageView!
    @IBOutlet weak var movieTableView: UITableView!
    
    var db = DBManager()
    var addedToMyList = false
    var moviesCollection: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.delegate = self
        db.fetchMovies()
        db.fetchMovies(by: .popular)
        db.fetchMovies(by: .top_rated)

    }
    
    var a: [Movies] = []
    func didUpdateMovie(data: Movies) {
        DispatchQueue.main.async {
            self.moviesCollection.append(data)
            self.movieTableView.reloadData()
        }
          
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setComponents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
        print("A ->",moviesCollection)
    }

    
    @IBAction func headerButtonsTapped(_ sender: UIButton) {
        switch sender.tag {
            case 1:
                addedToMyList = !addedToMyList
                myListImage.image = addedToMyList ? UIImage(systemName: "checkmark") : UIImage(systemName: "plus")
            case 2:
                print("Playing Elcamino")
                
            case 3:
                print("Open movie info")
        default:
            return
        }
    }
    
    
    func setComponents() {
        headerPlayButton.layer.cornerRadius = 10
    }

}


// MARK: - TableView Datasouce & Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: K.movieTableCellIdentifier, for: indexPath) as! MovieTableViewCell
//        cell.data = data[indexPath.row].movies
        cell.categoryTitleLabel.text = moviesCollection[indexPath.row].collectionTitle
        cell.data = moviesCollection[indexPath.row].movies
            switch indexPath.row {
                case 0:
                    cell.collectionType = .preview
                default:
                    cell.collectionType = .normal
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.view.frame.height/4.5)
    }
    
}




