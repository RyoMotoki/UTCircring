//
//  ResultBaseballViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/19.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

class ResultBaseballViewController: UIViewController {
    
    var point: Int = 0
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var detailTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        let point = userDefaults.integer(forKey: "point")
        
        if point < 7 || point > 100 && point < 110 {
            resultTextView.text = "硬式野球部"
            detailTextView.text = ""
        } else if point >= 7 && point < 10 || point > 300 && point < 310 {
            resultTextView.text = "丁友会硬式野球部"
            detailTextView.text = ""
        } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
            resultTextView.text = "準硬式野球部"
            detailTextView.text = ""
        } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
            resultTextView.text = "鉄門野球部"
            detailTextView.text = ""
        } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
            resultTextView.text = "軟式野球部"
            detailTextView.text = ""
        } else {
            resultTextView.text = "東大タクティクス"
            detailTextView.text = ""
        }
        
        //ベルスターズ/BIG BOX'S/セローリ/レオパーズ
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop() {
        // Modalで移動した画面を閉じる
        self.navigationController?.popToRootViewController(animated: true)
        
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
