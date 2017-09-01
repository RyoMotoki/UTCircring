//
//  CircleTableViewCell.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/20.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import NCMB

protocol SearchViewControllerDelegate {
    func didTapFavorite(button: UIButton)
}

class CircleTableViewCell: UITableViewCell, SearchViewControllerDelegate {
    func didTapFavorite(button: UIButton) {
        
    }


    
    var delegate: SearchViewControllerDelegate?
    
    @IBOutlet weak var favorite: UIButton!
    
    @IBOutlet weak var circleNameLabel: UILabel!
    
    var genre: String = ""
    
    var num: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func tapFavorite(sender: UIButton) {
        
        self.delegate?.didTapFavorite(button: favorite)
        /*
        if num == 0 {
            num = num + 1
            favorite.setTitle("★", for: .normal)
        } else {
            num = num - 1
            favorite.setTitle("☆", for: .normal)
        }
        */
        
        /*
        if favorite.tintColor == UIColor.red {
            
            let object = NCMBObject(className: "favorite")
            object?.remove(NCMBUser.current().objectId, forKey: "userObjectId")
            object?.saveInBackground({ (error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("保存完了")
                    self.favorite.tintColor = UIColor.init(red: 0, green: 109, blue: 250, alpha: 1.0)
                }
            })
            
        } else {
            
            let object = NCMBObject(className: "favorite")
            object?.addUniqueObject(NCMBUser.current().objectId, forKey: "userObjectId")
            object?.addUniqueObject(circleNameLabel.text, forKey: "circle")
            object?.saveInBackground({ (error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("保存完了")
                    self.favorite.tintColor = UIColor.red
                }
            })
            
        }
        */
        // TODO: リレーショナルにする
        /*
         if button.imageView?.image == nil {
         let object = NCMBObject(className: "\(genre)")
         object?.addUniqueObject(NCMBUser.current().objectId, forKey: "favo")
         object?.saveInBackground({ (error) in
         
         if error != nil {
         print(error!.localizedDescription)
         
         } else {
         print("保存完了")
         button.setImage(UIImage(named: "8714204.jpg"), for: .normal)
         }
         })
         } else {
         let object = NCMBObject(className: "Circle")
         object?.remove(NCMBUser.current().objectId, forKey: "favo")
         object?.saveInBackground({ (error) in
         if error != nil {
         
         } else {
         button.setImage(nil, for: .normal)
         }
         })
         }
         
         */
        
        
    }
    
    
    
    
}

