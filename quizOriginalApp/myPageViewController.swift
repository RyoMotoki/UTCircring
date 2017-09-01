//
//  myPageViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/20.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

import NCMB
import FontAwesomeKit

class myPageViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginLogoutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if NCMBUser.current() == nil {
            loginLogoutLabel.text = "ログイン"
        } else {
            loginLogoutLabel.text = "ログアウト"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userInfo() {
        if NCMBUser.current() == nil {
            let alert: UIAlertController = UIAlertController(title: "ユーザー情報", message: "この機能はログイン後でないと使うことはできません。", preferredStyle: UIAlertControllerStyle.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) -> Void in
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert: UIAlertController = UIAlertController(title: "ユーザー情報", message: "お気に入り機能はバージョン2.0以降でご利用頂けます。リリースまでしばらくお待ち下さい。", preferredStyle: UIAlertControllerStyle.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) -> Void in
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            //performSegue(withIdentifier: "toUser", sender: nil)
        }
    }
    
    @IBAction func userFavo() {
        if NCMBUser.current() == nil {
            let alert: UIAlertController = UIAlertController(title: "お気に入り一覧", message: "この機能はログイン後でないと使うことはできません。", preferredStyle: UIAlertControllerStyle.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) -> Void in
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert: UIAlertController = UIAlertController(title: "お気に入り一覧", message: "お気に入り機能はバージョン2.0以降でご利用頂けます。リリースまでしばらくお待ち下さい。", preferredStyle: UIAlertControllerStyle.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) -> Void in
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            //performSegue(withIdentifier: "toFavo", sender: nil)
        }
    }
    
    
    @IBAction func addCircle() {
        if NCMBUser.current() == nil {
            let alert: UIAlertController = UIAlertController(title: "サークル追加申請", message: "この機能はログイン後でないと使うことはできません。", preferredStyle: UIAlertControllerStyle.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) -> Void in
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            
            performSegue(withIdentifier: "toAdd", sender: nil)
        }
    }
    
    @IBAction func signOut() {
        // if user is not empty...
        if NCMBUser.current() != nil {
            let alert = UIAlertController(title: "ログアウト", message: "ログアウトしますか？", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                // ログアウト
                NCMBUser.logOutInBackground { (error) in
                    if error != nil {
                        // エラーが出たら出力
                        print(error!.localizedDescription)
                    } else {
                        // ログアウトに成功したらログイン画面のStoryboardを起動
                        self.performSegue(withIdentifier: "toSignIn", sender: nil)
                        self.loginLogoutLabel.text = "ログイン"
                        
                        // UserDefaultsのログイン情報をfalseに
                        let ud = UserDefaults.standard
                        ud.set(false, forKey: "isSignIn")
                        ud.synchronize()
                    }
                }
            })
            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            // if user is empty...
            self.performSegue(withIdentifier: "toSignIn", sender: nil)
        }
    }

    
}
