//
//  BaseballViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/19.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

class BaseballViewController: UIViewController {
    
    
    var quizNumber: Int = 0
    var point: Int = 0
    var quizArray: [(String, Int, Int, Int, Int, Int)] = []
    
    @IBOutlet var maruButton: UIButton!
    @IBOutlet var batsuButton: UIButton!
    @IBOutlet var sannkakuButton: UIButton!
    @IBOutlet var maruWeakButton: UIButton!
    @IBOutlet var batsuWeakButton: UIButton!
    
    @IBOutlet var quizProgressLabel: UILabel!
    @IBOutlet var quizProgressView: UIProgressView!
    
    
    @IBOutlet var quizTextView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpQuiz()
        
        
        maruButton.layer.cornerRadius = maruButton.bounds.height / 2
        batsuButton.layer.cornerRadius = batsuButton.bounds.height / 2
        sannkakuButton.layer.cornerRadius = sannkakuButton.bounds.height / 2
        maruWeakButton.layer.cornerRadius = maruWeakButton.bounds.height / 2
        batsuWeakButton.layer.cornerRadius = batsuWeakButton.bounds.height / 2
        
        quizProgressView.transform = CGAffineTransform(scaleX: 1.0, y: 8.0)
        quizProgressView.progress = 0.0
        
        

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // このViewControllerが制御する画面が表示される度に呼ばれる
        resetResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpQuiz() {
        
        // タプルを使って複数の情報をひとまとめにする
        let quiz0 = (text: "東大女子か他大女子なら\n東大女子がいい", point: 100, point: 0, point: 300, point: 0, point: 0)
        let quiz1 = (text: "サークルは緩くやりたい", point: 3, point: 0, point: 1, point: 0, point: 2)
        let quiz2 = (text: "大学の飲みは楽しみだ", point: 5, point: 0, point: 0, point: 0, point: 3)
        let quiz3 = (text: "同期の男子に明るさと落ち着きなら\n明るさを求めたい", point: 5, point: 0, point: 1, point: 0, point: 3)
        let quiz4 = (text: "同期の女子に明るさと落ち着きなら\n明るさを求めたい", point: 5, point: 0, point: 1, point: 0, point: 3)
        let quiz5 = (text: "他サークルと交流があると嬉しい", point: 3, point: 0, point: 1, point: 0, point: 2)
        
        
        
        // quizArrayに追加していく
        quizArray.append(quiz0)
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
        quizArray.append(quiz5)
        
        
    }
    
    func updateQuizText() {
        // .countは配列の要素の"個数"を取得するので、0から数えている普通の数字とズレるので1を引く
        quizTextView.alpha = 0.0
        if quizNumber == quizArray.count - 1 {
            
            quizProgressView.setProgress(Float(1.0), animated: true)
            
            
            // 問題が終わったら結果をアプリ内に保存
            let userDefaults = UserDefaults.standard
            userDefaults.set(point, forKey: "point")
            userDefaults.synchronize()
            
            // 結果表示
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.performSegue(withIdentifier: "toResult", sender: nil)
            }
            //performSegue(withIdentifier: "toResult", sender: nil)
        } else {
            // 更新
            quizNumber = quizNumber + 1
            quizTextView.text = quizArray[quizNumber].0
            
            quizProgressLabel.text = "\(quizNumber + 1)問目 / \(quizArray.count)問中"
            quizProgressView.setProgress(Float(quizNumber)/Float(quizArray.count), animated: true)
            
        }
        
        
        UIView.animate(withDuration: 1.0) {
            self.quizTextView.alpha = 1.0
        }
        
    }
    
    func resetResult() {
        
        // 結果をリセット
        quizNumber = 0
        point = 0
        quizTextView.text = quizArray[quizNumber].0
        
        quizProgressView.setProgress(Float(quizNumber)/Float(quizArray.count), animated: true)
        quizProgressLabel.text = "\(quizNumber + 1)問目 / \(quizArray.count)問中"
        
    }
    
    
    @IBAction func tappedMaru() {
        // 各問題で◯を選んだ場合に得点を付ける
        point = point + quizArray[quizNumber].1
        
        
        
        // 問題文を更新
        updateQuizText()
    }
    
    @IBAction func tappedWeakMaru() {
        // 各問題で◯を選んだ場合に得点を付ける
        point = point + quizArray[quizNumber].2
        
        
        
        // 問題文を更新
        updateQuizText()
    }
    
    
    @IBAction func tappedSannkaku() {
        
        point = point + quizArray[quizNumber].3
        
        
        updateQuizText()
        
    }
    
    
    @IBAction func tappedWeakBatsu() {
        // 各問題で◯を選んだ場合に得点を付ける
        point = point + quizArray[quizNumber].4
        
        
        
        // 問題文を更新
        updateQuizText()
    }
    
    
    @IBAction func tappedBatsu() {
        // 各問題で✕を選んだ場合に得点を付ける
        point = point + quizArray[quizNumber].5
        
        
        // 問題文を更新
        updateQuizText()
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
