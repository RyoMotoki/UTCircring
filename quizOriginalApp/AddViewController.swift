//
//  AddViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/08/30.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import NCMB


class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cNameTF: UITextField!
    @IBOutlet weak var cDetailTF: UITextField!
    @IBOutlet weak var cActiveTF: UITextField!
    @IBOutlet weak var cManTF: UITextField!
    @IBOutlet weak var cAddressTF: UITextField!
    @IBOutlet weak var cSnsTF: UITextField!
    @IBOutlet weak var cRateTF: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        cNameTF.delegate = self
        cDetailTF.delegate = self
        cActiveTF.delegate = self
        cManTF.delegate = self
        cAddressTF.delegate = self
        cSnsTF.delegate = self
        cRateTF.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    @IBAction func add() {
        
        guard let cName = cNameTF.text else {
            return
        }
        
        guard let cDetail = cDetailTF.text else {
            return
        }
        
        guard let cActive = cActiveTF.text else {
            return
        }
        
        guard let cMan = cManTF.text else {
            return
        }
        
        guard let cAddress = cAddressTF.text else {
            return
        }
        
        guard let cSns = cSnsTF.text else {
            return
        }
        
        guard let cRate = cRateTF.text else {
            return
        }
        
        if cName.characters.count > 0 && cDetail.characters.count > 0 && cActive.characters.count > 0 && cMan.characters.count > 0 && cAddress.characters.count > 0 && cSns.characters.count > 0 && cRate.characters.count > 0 {
            
            let obj = NCMBObject(className: "Circle")
            
            obj?.setObject(cName, forKey: "circleName")
            obj?.setObject(cDetail, forKey: "detail")
            obj?.setObject(cActive, forKey: "activeDate")
            obj?.setObject(cMan, forKey: "manWoman")
            obj?.setObject(cAddress, forKey: "address")
            obj?.setObject(cSns, forKey: "sns")
            obj?.setObject(cRate, forKey: "rateUniversity")
            
            obj?.saveInBackground({(error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    let alert: UIAlertController = UIAlertController(title: "申請完了", message: "申請完了しました。審査が終わるまで3日ほどお待ちください。", preferredStyle: UIAlertControllerStyle.alert)
                    let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                        (action: UIAlertAction!) -> Void in
                        self.navigationController?.popViewController(animated: true)
                        
                    })
                    
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            })
            
            
            
            
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
