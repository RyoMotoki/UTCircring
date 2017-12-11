//
//  TabBarController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/20.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import NCMB
import FontAwesomeKit


class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* FontAwesome
         let userIcon = FAKFontAwesome.addressBookOIcon(withSize: 22)
         let tabImage = userIcon?.image(with: CGSize(width: 15,height: 15))
         tabBar.items![2].selectedImage = tabImage
         */
        //self.tabBar.unselectedItemTintColor = UIColor.darkGray
        //self.tabBar.unselectedItemTintColor = UIColor(red: 250.0/255.0, green: 177.0/255.0, blue: 175.0/255.0, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == tabBar.items?[2] {
            if NCMBUser.current() == nil {
                // Segue to SignInViewController
            } else {
                // through
            }
        }
    }
    
    
}

