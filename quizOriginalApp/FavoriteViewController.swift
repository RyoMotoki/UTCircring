//
//  FavoriteViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/08/03.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import NCMB

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var FavoriteTableView: UITableView!
    
    var userFavoCircle = [NCMBObject]()
    var userFavorites = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FavoriteTableView.delegate = self
        FavoriteTableView.dataSource = self
        
        loadDate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFavoCircle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavoriteTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        
        cell.tag = indexPath.row
        
        cell.textLabel?.text = "うんこ"
        
        return cell
    }
    
    func loadDate() {
        
        let query = NCMBQuery(className: "")
        
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
                    
                } else {
                    for object in favoriteObjects {
                        let favoriteObjectId = object.object(forKey: "circleObjectId") as! String
                        self.userFavorites.append(favoriteObjectId)
                        print("\(favoriteObjectId)")
                        //self.circleTableView.reloadData()
                        print("リロードした")
                    }
                }
                
            }
        })
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
