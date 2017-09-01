//
//  SearchViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/20.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import NCMB


class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SearchViewControllerDelegate {
    
    var circle = [NCMBObject]()
    var selectedIndex: Int = 0
    var genreNCMB: String = ""
    
    var userFavorites = [String]()
    
    @IBOutlet weak var circleTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleTableView.dataSource = self
        circleTableView.delegate = self
        
        circleTableView.rowHeight = 75
        
        // searchBarをNavigationBarに載せる
        let searchBar = UISearchBar()
        searchBar.placeholder = "キーワードを入力して検索"
        self.navigationItem.titleView = searchBar
        
        // カスタムセルをTableViewに登録
        let nib = UINib(nibName: "CircleTableViewCell", bundle: Bundle.main)
        circleTableView.register(nib, forCellReuseIdentifier: "Cell")

        // Load data
        loadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circle.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CircleTableViewCell
        
        cell.circleNameLabel.text = circle[indexPath.row].object(forKey: "circleName") as? String
        cell.tag = indexPath.row
        cell.favorite.tag = indexPath.row
        
        
        //お気に入りボタンの色の設定をかく
        
        if userFavorites.contains(circle[indexPath.row].objectId) == true {
            
            // いいねされてたら
            cell.favorite.setTitle("★", for: .normal)
            
        } else {
            
            // その他
            cell.favorite.setTitle("☆", for: .normal)
        }
        
        
        cell.delegate = self
        
        return cell
        
    }
    
    func didTapFavorite(button: UIButton) {
        
        if NCMBUser.current() == nil {
            
            let alert: UIAlertController = UIAlertController(title: "お気に入り", message: "この機能はMyPage作成後でないと使うことはできません。", preferredStyle: UIAlertControllerStyle.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) -> Void in
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        } else {
            
            let query = NCMBQuery(className: "favorite")
            query?.whereKey("circleObjectId", equalTo: circle[button.tag].objectId)
            query?.whereKey("userObjectId", equalTo: NCMBUser.current().objectId)
            query?.findObjectsInBackground({ (result, error) in
                if error != nil {
                    
                    
                    print(error!.localizedDescription)
                    
                } else {
                    
                    if result?.count == 0 {
                        
                        let object = NCMBObject(className: "favorite")
                        object?.setObject(NCMBUser.current().objectId, forKey: "userObjectId")
                        object?.setObject(self.circle[button.tag].objectId, forKey: "circleObjectId")
                        object?.saveInBackground({ (error) in
                            
                            if error != nil {
                                print(error!.localizedDescription)
                            } else {
                                print("保存完了")
                                button.setTitle("★", for: .normal)
                                //button.tintColor = UIColor.red
                            }
                        })
                        
                    } else {
                        
                        
                        let object = NCMBObject(className: "favorite")
                        let deleteObject = result as! [NCMBObject]
                        print("\(deleteObject[0].objectId)")
                        let Id = deleteObject[0].objectId
                        object?.objectId = Id
                        object?.fetchInBackground({ (error) in
                            if error != nil {
                                // 取得に失敗した場合の処理
                                print(error!.localizedDescription)
                                print("取得失敗")
                                
                            }else{
                                // 取得に成功した場合の処理
                                
                                object?.deleteInBackground({ (error) in
                                    if error != nil {
                                        print(error!.localizedDescription)
                                        print("削除失敗")
                                    } else {
                                        button.setTitle("☆", for: .normal)
                                        //button.tintColor = UIColor.blue
                                        print("削除完了")
                                    }
                                    
                                })
                                
                            }
                        })
                        
                    }
                    
                }
            })
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func loadData() {
        
        print(genreNCMB)
        
        let query = NCMBQuery(className: "\(genreNCMB)")
        query?.findObjectsInBackground({ (result, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.circle = result as! [NCMBObject]
                
                if NCMBUser.current() == nil {
                    self.circleTableView.reloadData()
                } else {
                    print("取得")
                    let favoriteQuery = NCMBQuery(className: "favorite")
                    favoriteQuery?.whereKey("userObjectId", equalTo: NCMBUser.current().objectId)
                    print("\(NCMBUser.current().objectId)")
                    favoriteQuery?.findObjectsInBackground({ (result, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                        } else {
                            print("favo取得")
                            let favoriteObjects = result as! [NCMBObject]
                            print("\(favoriteObjects)")
                            if favoriteObjects.count == 0 {
                                self.circleTableView.reloadData()
                            } else {
                                for object in favoriteObjects {
                                    let favoriteObjectId = object.object(forKey: "circleObjectId") as! String
                                    self.userFavorites.append(favoriteObjectId)
                                    print("\(favoriteObjectId)")
                                    self.circleTableView.reloadData()
                                    print("リロードした")
                                }
                            }
                            
                        }
                    })
                }
            }
        })
        
        
        
        
    }
    
    
    
    @IBAction func reloadData() {
        loadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toDetailViewController = segue.destination as! toDetailViewController
        toDetailViewController.circle = circle[selectedIndex]
        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedIndex = indexPath.row
        
        
        return indexPath
    }
    
    
}
