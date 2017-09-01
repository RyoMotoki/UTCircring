//
//  SignUpViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/20.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

import NCMB



class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var checkB: UIButton!
    
    let checkedI = UIImage(named: "dbad138c-19a4-05d2-b393-e4b4481eebaf.png")
    let checkI = UIImage(named: "b2945f08-ae8a-de63-b9cf-e5e66948a9f7.png")
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    /*
    @IBOutlet weak var userFullnameTextField: UITextField!
    @IBOutlet weak var userNumberTextField: UITextField!
    @IBOutlet weak var userClassTextField: UITextField!
    @IBOutlet weak var userCircleTeamTextField: UITextField!
    */


    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        // キーボードを閉じる(完了ボタンの検知の)ためにDelegateを設定
        usernameTextField.delegate = self
        mailAddressTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
        /*
        userFullnameTextField.delegate = self
        userNumberTextField.delegate = self
        userClassTextField.delegate = self
        userCircleTeamTextField.delegate = self
        */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // キーボードのReturnキーが押されたときを検知し、キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func registerUser() {
        
        // ちゃんと書き込まれているかチェックし、文字数が0なら反応しないようにする
        if usernameTextField.text?.characters.count == 0 {
            return
        }
        
        if mailAddressTextField.text?.characters.count == 0 {
            return
        }
        
        if passwordTextField.text?.characters.count == 0 {
            return
        }
        
        if passwordTextField.text != confirmTextField.text {
            return
        }
        
        if checkB.image(for: UIControlState()) == checkI {
            return
        }
        
        // ユーザー情報をNCMBのユーザー情報を保存するクラスに保存
        // CRUDの「C」(Create)
        let user = NCMBUser()
        user.userName = usernameTextField.text!
        user.mailAddress = mailAddressTextField.text
        user.password = passwordTextField.text
        /*
        user.userFullname = userFullnameTextField.text
        */
        
        
        NCMBUser.requestAuthenticationMail(mailAddressTextField.text, error: nil)
        user.signUpInBackground { (error) in
            if error != nil {
                // エラーが起きた場合
                print(error!.localizedDescription)
            } else {
                // 新規登録が完了した場合、Main.storyboardを起動
                
                //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                
                //UIApplication.shared.keyWindow?.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "MPVC")
                
                self.navigationController?.popToRootViewController(animated: true)
                
                
                // UserDefaultsにログイン済みと記録
                let ud = UserDefaults.standard
                ud.set(true, forKey: "isSignIn")
                ud.synchronize()
            }
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func tapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func checkButton() {
        if checkB.image(for: UIControlState()) == checkI {
            checkB.setImage(checkedI, for: UIControlState())
        } else {
            checkB.setImage(checkI, for: UIControlState())
        }
        
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
