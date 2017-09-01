//
//  ResultTennisViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/10.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

class ResultFootballViewController: UIViewController {
    
    
    var point: Int = 0
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var detailTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        let point = userDefaults.integer(forKey: "point")
        
        detailTextView.text = ""
        
        if point < 7 || point > 100 && point < 110 {
            resultTextView.text = "ア式蹴球部"
        } else if point >= 7 && point < 10 || point > 300 && point < 310 {
            resultTextView.text = "鉄門サッカー部"
        } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
            resultTextView.text = "スポ愛サカパ"
        } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
            resultTextView.text = "SPERANZA F.C"
        } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
            resultTextView.text = "SUNDAY KICKERS"
        } else {
            resultTextView.text = "HOT SPURS"
        }
        //BLUE SPOT/TWOPERS/ビッグスカイウィングス/FCカンパネラ/EITHER WAY/PASSERS
        

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
