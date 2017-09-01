//
//  SignInViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/20.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

import NCMB


class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailAddressTextField.delegate = self
        passwordTextField.delegate = self

        //self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn() {
        
        // メールアドレス、パスワードのnilチェック
        guard let address = mailAddressTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        if address.characters.count > 0 && password.characters.count > 0 {
            // ログイン
            NCMBUser.logInWithMailAddress(inBackground: address, password: password) { (user, error) in
                if error != nil {
                    // エラーが起きた場合は出力
                    self.showAlert()
                } else {
                    self.navigationController?.popViewController(animated: true)
                    
                    // UserDefaultsのログイン情報をログイン済に変更
                    let ud = UserDefaults.standard
                    ud.set(true, forKey: "isSignIn")
                    ud.synchronize()
                }
            }
        } else {
            showAlert()
        }
    }
    
    @IBAction func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func showAlert() {
        let alert: UIAlertController = UIAlertController(title: "入力エラー", message: "入力に不備があるためログインできません。メールアドレスまたはパスワードが正しく入力されているか、ご確認下さい。", preferredStyle: UIAlertControllerStyle.alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    

}
