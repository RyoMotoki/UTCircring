//
//  ResultViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/02/22.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

import NCMB

class ResultViewController: UIViewController {
    
    var point: Int = 0
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var detailTextView: UITextView!
    
    var detailObject: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        let point = userDefaults.integer(forKey: "point")
        
        if point < 7 || point > 100 && point < 110 {
            resultTextView.text = "TOMATO"
            detailTextView.text = "学内オンリーのテニスサークルです。東大にしてはウェイが集まるサークルで、スポーツ愛好会での親睦もあり友達を増やすには最適なサークルである。"
        } else if point >= 7 && point < 10 || point > 300 && point < 310 {
            resultTextView.text = "ALLDC"
            detailTextView.text = "\(detailObject)"
        } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
            resultTextView.text = "Lemon Smash"
            detailTextView.text = ""
        } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
            resultTextView.text = "スポーツ愛好会テニパ"
            detailTextView.text = ""
        } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
            resultTextView.text = "Sun Friend"
            detailTextView.text = ""
        } else {
            resultTextView.text = "WEEKEND"
            detailTextView.text = ""
        }
        
        
        //庭球部男子/軟式庭球部男子/APRICOT/BESTER/COSMOS/スポ愛NANNAN/HALE/AMOURETTE/ANOTHERWAY/JOKER/WOODPECKER/SIGMA/A-DASH/SMASH AND SPUR/GROUP FLATES
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func getCircleDetail(_ circleName:String) -> String {
        var detail:String = "\(resultTextView.text)"
        
        let query = NCMBQuery(className: "tennis")
        query?.whereKey("circleName", equalTo: circleName)
        query?.findObjectsInBackground({ (result, error) in
            print(result)
        })
        
        
        var results:[AnyObject] = []
        do {
            results = try query!.findObjects() as [AnyObject]
        } catch  let error1 as NSError  {
            print("\(error1)")
            return detail
        }
        if results.count > 0 {
            let result = results[0] as? NCMBObject
            detail = result?.object(forKey:"detail")  as? String ?? "\(resultTextView.text)"
            detailObject = detail
        }
        return detail
    }

}
