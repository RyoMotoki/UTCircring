//
//  myPageCorrectViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/22.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import NCMB

class myPageCorrectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contents = [String]()
    
    var currentUser: NCMBUser!
    
    var cUser: NCMBObject!
    
    @IBOutlet var userInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInfoTableView.dataSource = self
        userInfoTableView.delegate = self
        
        contents.append("ユーザーID")
        contents.append("名前")
        contents.append("学年")
        contents.append("科類/学部学科")
        contents.append("部活/サークル")
        
        userInfoTableView.tableFooterView = UIView()
        
        //loadUserInfo()
        
        //print("\(currentUser)")
        print("\(cUser)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return contents.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor.groupTableViewBackground
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            imageView.center = CGPoint(x: userInfoTableView.center.x, y: 90)
            imageView.image = UIImage(named: "placeholder")
            imageView.layer.cornerRadius = 40.0
            imageView.layer.masksToBounds = true
            cell.contentView.addSubview(imageView)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = contents[indexPath.row]
            let detailLabel = cell.viewWithTag(1) as! UILabel
            //print(NCMBUser.current())
            switch indexPath.row {
            case 0:
                detailLabel.text = NCMBUser.current().userName
            case 1:
                detailLabel.text = "未登録"
                /*
                 if NCMBUser.current().object(forKey: "userFullname") == nil {
                 print("取得失敗")
                 //print("\(NCMBUser.current().object(forKey: "name"))")
                 //print("\(NCMBUser.current().mailAddress)")
                 //print("\(NCMBUser.current().object(forKey: "userFullname"))")
                 detailLabel.text = "未登録"
                 } else {
                 print("取得成功")
                 detailLabel.text = NCMBUser.current().object(forKey: "userFullname") as! String
                 }
                 */
            case 2:
                detailLabel.text = "未登録"
                /*
                 if NCMBUser.current().object(forKey: "userNumber") == nil {
                 print("取得失敗")
                 print("\(NCMBUser.current().object(forKey: "userNumber"))")
                 detailLabel.text = "未登録"
                 } else {
                 print("取得成功")
                 detailLabel.text = "\(NCMBUser.current().object(forKey: "userNumber"))"
                 }
                 
                 */
            case 3:
                detailLabel.text = "未登録"
                /*             if NCMBUser.current().object(forKey: "userClass") == nil {
                 print("取得失敗")
                 print("\(NCMBUser.current().object(forKey: "userClass"))")
                 detailLabel.text = "未登録"
                 } else {
                 print("取得成功")
                 detailLabel.text = "\(NCMBUser.current().object(forKey: "userClass"))"
                 }
                 */
            case 4:
                detailLabel.text = "未登録"
                /*         if NCMBUser.current().object(forKey: "userCircleTeam") == nil {
                 print("取得失敗")
                 print("\(NCMBUser.current().object(forKey: "userCircleTeam"))")
                 detailLabel.text = "未登録"
                 } else {
                 print("取得成功")
                 detailLabel.text = "\(NCMBUser.current().object(forKey: "userCircleTeam"))"
                 }
                 */
            default:
                break
            }
            return cell
        } else {
            cell.backgroundColor = UIColor.groupTableViewBackground
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row != 0 {
            let alert = UIAlertController(title: "\(contents[indexPath.row])の編集", message: "新しい\(contents[indexPath.row])を入力して下さい。OKを押すと保存されます。", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "ここに入力"
            }
            
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (cancel) in
                alert.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // ユーザー名が編集されて、キーボードの閉じるが押されたときにサーバーのユーザー名も変更
    // CRUDの「U」(Update)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 自分のユーザーオブジェクトのobjectIdが一致するものを取得し、更新
        let query = NCMBUser.query()
        query?.getObjectInBackground(withId: NCMBUser.current().objectId, block: { (object, error) in
            if error != nil {
                // サーバーのユーザーオブジェクトの取得にエラーがあったら出力
                print(error!.localizedDescription)
            } else {
                object?.setObject(textField.text, forKey: "userName")
                object?.setObject(textField.text, forKey: "userFullName")
                object?.setObject(textField.text, forKey: "userNumber")
                object?.setObject(textField.text, forKey: "userClass")
                object?.setObject(textField.text, forKey: "userCircleTeam")
                object?.saveInBackground({ (error) in
                    if error != nil {
                        // 更新に失敗した場合エラーを出力
                        print(error!.localizedDescription)
                    }
                })
            }
        })
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    /*
    func loadUserInfo() {
        let query = NCMBQuery(className: "user")
        query?.getObjectInBackground(withId: NCMBUser.current().objectId, block: { (object, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("\(object)")
                self.currentUser = object as! NCMBUser
                //self.cUser = object!
                self.userInfoTableView.reloadData()
            }
        })
    }
    */
    
}
