//
//  SearchStartViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/04/14.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import NCMB
import FontAwesomeKit

class SearchStartViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    var genres = [Genre]()

    var searchResult = [Genre]()
    
    var searchBar: UISearchBar!
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // searchBarをNavigationBarに載せる
        searchBar = UISearchBar()
        self.navigationItem.titleView = searchBar
        
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.placeholder = "キーワードを入力して検索"
        searchBar.delegate = self
        
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self

        // Set initial Data
        configure()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchResult.count > 0 {
            return searchResult.count
        } else {
            return genres.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if searchResult.count > 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            let imageView = cell.viewWithTag(1) as! UIImageView
            let countLabel = cell.viewWithTag(2) as! UILabel
            let titleLabel = cell.viewWithTag(3) as! UILabel
            
            imageView.image = UIImage(named: searchResult[indexPath.row].imageName)
            let query = NCMBQuery(className: searchResult[indexPath.row].key)
            query?.countObjectsInBackground({ (count, error) in
                countLabel.text = String(count)
            })
            titleLabel.text = searchResult[indexPath.row].name
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            let imageView = cell.viewWithTag(1) as! UIImageView
            let countLabel = cell.viewWithTag(2) as! UILabel
            let titleLabel = cell.viewWithTag(3) as! UILabel
            
            imageView.image = UIImage(named: genres[indexPath.row].imageName)
            let query = NCMBQuery(className: genres[indexPath.row].key)
            query?.countObjectsInBackground({ (count, error) in
                countLabel.text = String(count)
            })
            titleLabel.text = genres[indexPath.row].name
            
            return cell
        }
    }
    
    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSearch", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    // MARK: - SearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let text = searchBar.text {
            searchResult = []
            
            for genre in genres {
                if genre.name.contains(text) {
                    searchResult.append(genre)
                }
            }
        }
        
        genreCollectionView.reloadData()
        
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text {
            searchResult = []
            
            for genre in genres {
                if genre.name.contains(text) {
                    searchResult.append(genre)
                }
            }
        }
        
        genreCollectionView.reloadData()
    }
    
    // Override
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let searchViewController = segue.destination as! SearchViewController
        let selectedIndex = genreCollectionView.indexPathsForSelectedItems![0]
        searchViewController.genreNCMB = genres[selectedIndex.row].key
    }
    
    func loadGenreData() {
        let query = NCMBQuery(className: "football")
        query?.countObjectsInBackground({ (count, error) in
            
        })
    }
    
    func configure() {
        let soccer = Genre(key: "football", name: "サッカー・フットサル", imageName: "icon-soccer")
        let tennis = Genre(key: "tennis", name: "テニス", imageName: "icon-tennis")
        let baseball = Genre(key: "baseball", name: "野球", imageName: "icon-baseball")
        let badminton = Genre(key: "badminton", name: "バドミントン", imageName: "icon-badminton")
        let chorus = Genre(key: "chorus", name: "合唱・アカペラ", imageName: "icon-chorus")
        let orchestra = Genre(key: "orchestra", name: "オーケストラ", imageName: "icon-orchestra")
        let theater = Genre(key: "theater", name: "演劇", imageName: "icon-actor")
        
        genres.append(soccer)
        genres.append(tennis)
        genres.append(baseball)
        genres.append(badminton)
        genres.append(chorus)
        genres.append(orchestra)
        genres.append(theater)

    }
    
}
