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
        let genre = userDefaults.string(forKey: "genre")
        
        if genre == "テニス" {
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
        } else if genre == "サッカー" {
            if point < 7 || point > 100 && point < 110 {
                resultTextView.text = "ア式蹴球部"
                detailTextView.text = ""
            } else if point >= 7 && point < 10 || point > 300 && point < 310 {
                resultTextView.text = "鉄門サッカー部"
                detailTextView.text = ""
            } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
                resultTextView.text = "スポ愛サカパ"
                detailTextView.text = ""
            } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
                resultTextView.text = "SPERANZA F.C"
                detailTextView.text = ""
            } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
                resultTextView.text = "SUNDAY KICKERS"
                detailTextView.text = ""
            } else {
                resultTextView.text = "HOT SPURS"
                detailTextView.text = ""
            }
            //BLUE SPOT/TWOPERS/ビッグスカイウィングス/FCカンパネラ/EITHER WAY/PASSERS
        } else if genre == "野球" {
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
        } else if genre == "バドミントン" {
            if point < 7 || point > 100 && point < 110 {
                resultTextView.text = "バドミントン部"
                detailTextView.text = "東京大学のバドミントン部です"
            } else if point >= 7 && point < 10 || point > 300 && point < 310 {
                resultTextView.text = "丁友会ラブオール"
                detailTextView.text = "本郷系のバドミントンサークルです"
            } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
                resultTextView.text = "鉄門バドミントン部"
                detailTextView.text = "医学部のバドミントン部です"
            } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
                resultTextView.text = "東大パンプキン"
                detailTextView.text = ""
            } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
                resultTextView.text = "バドミントン同好会ひこうせん"
                detailTextView.text = ""
            } else {
                resultTextView.text = "スペースシャトル"
                detailTextView.text = ""
            }
            //スポーツ愛好会バドミントンパート/バドミントン同好会
        } else if genre == "合唱・アカペラ" {
            if point < 7 || point > 100 && point < 110 {
                resultTextView.text = "音楽部合唱団コールアカデミー"
                detailTextView.text = ""
            } else if point >= 7 && point < 10 || point > 300 && point < 310 {
                resultTextView.text = "音楽部女声合唱団コーロ・レティツィア"
                detailTextView.text = ""
            } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
                resultTextView.text = "緑会合唱団"
                detailTextView.text = ""
            } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
                resultTextView.text = "柏葉会合唱団"
                detailTextView.text = ""
            } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
                resultTextView.text = "コーロ・ソーノ合唱団"
                detailTextView.text = ""
            } else {
                resultTextView.text = "合唱団コール・ユリゼン"
                detailTextView.text = ""
            }
            //合唱団ムジカサクラ/白ばら会合唱団/合唱団あらぐさ/東京大学歌劇団/アカペラサークルLAVOCE
        } else if genre == "オーケストラ" {
            if point < 7 || point > 100 && point < 110 {
                resultTextView.text = "音楽部管弦楽団"
                detailTextView.text = ""
            } else if point >= 7 && point < 10 || point > 300 && point < 310 {
                resultTextView.text = "フィルハーモニー管弦楽団"
                detailTextView.text = ""
            } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
                resultTextView.text = "ブラスアカデミー"
                detailTextView.text = ""
            } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
                resultTextView.text = "フォイヤーヴェルク管弦楽団"
                detailTextView.text = ""
            } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
                resultTextView.text = "フィロムジカ交響楽団"
                detailTextView.text = ""
            } else {
                resultTextView.text = "フィロムジカ交響楽団"
                detailTextView.text = ""
            }
        } else if genre == "演劇" {
            if point < 7 || point > 100 && point < 110 {
                resultTextView.text = "劇団綺畸"
                detailTextView.text = ""
            } else if point >= 7 && point < 10 || point > 300 && point < 310 {
                resultTextView.text = "劇工舎プリズム"
                detailTextView.text = ""
            } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
                resultTextView.text = "ミュージカルサークルCLAVIS"
                detailTextView.text = ""
            } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
                resultTextView.text = "劇団 RADISH"
                detailTextView.text = ""
            } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
                resultTextView.text = "シアターマーキュリー"
                detailTextView.text = ""
            } else {
                resultTextView.text = "劇団高校四年生"
                detailTextView.text = ""
            }
            //映画制作スピカ1895/特撮映像研究会/NON PERIOD.
        } else if genre == "文芸" {
            if point < 7 || point > 100 && point < 110 {
                resultTextView.text = "文芸部"
                detailTextView.text = ""
            } else if point >= 7 && point < 10 || point > 300 && point < 310 {
                resultTextView.text = "ペンクラブ"
                detailTextView.text = ""
            } else if point >= 10 && point < 13 || point >= 310 && point < 315 {
                resultTextView.text = "新月お茶の会"
                detailTextView.text = ""
            } else if point >= 13 && point < 16 || point >= 110 && point < 150 {
                resultTextView.text = "創文会"
                detailTextView.text = ""
            } else if point >= 16 && point < 19 || point >= 315 && point < 319 {
                resultTextView.text = "文学部"
                detailTextView.text = ""
            } else {
                resultTextView.text = "文学研究会"
                detailTextView.text = ""
            }
            //書評委員会ひろば/ビジュアルノベル同好会/古文サークルすずのや/児童文学を読む会/出版甲子園
        }
        
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
