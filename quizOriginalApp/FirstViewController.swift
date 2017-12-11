//
//  FirstViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/10.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit
import SpriteKit
import Magnetic

class FirstViewController: UIViewController, MagneticDelegate {
    
    @IBOutlet weak var circleBubbleView: SKView!
    
    @IBOutlet weak var explainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let magnetic = Magnetic(size: circleBubbleView.bounds.size)
        magnetic.magneticDelegate = self
        magnetic.allowsMultipleSelection = false
        
        let tennis = Node(text: "テニス", image: UIImage(named: "italy"), color: .orange, radius: 44)
        let soccer = Node(text: "サッカー", image: UIImage(named: "italy"), color: .blue, radius: 44)
        let baseball = Node(text: "野球", image: UIImage(named: "italy"), color: .red, radius: 44)
        let badminton = Node(text: "バドミントン", image: UIImage(named: "italy"), color: .brown, radius: 44)
        let chorus = Node(text: "合唱・アカペラ", image: UIImage(named: "italy"), color: .cyan, radius: 44)
        let orchestra = Node(text: "オーケストラ", image: UIImage(named: "italy"), color: .yellow, radius: 44)
        let theater = Node(text: "演劇", image: UIImage(named: "italy"), color: .darkGray, radius: 44)
        let literature = Node(text: "文芸", image: UIImage(named: "italy"), color: .green, radius: 44)
        
        magnetic.addChild(tennis)
        magnetic.addChild(soccer)
        magnetic.addChild(baseball)
        magnetic.addChild(badminton)
        magnetic.addChild(chorus)
        magnetic.addChild(orchestra)
        magnetic.addChild(theater)
        magnetic.addChild(literature)
        
        circleBubbleView.presentScene(magnetic)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.explainLabel.alpha = 1.0
        }) { (finished) in
            if finished == true {
                UIView.animate(withDuration: 1.0, animations: {
                    self.explainLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 230)
                }, completion: { (finished) in
                    self.circleBubbleView.alpha = 1.0
                })
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - MagneticDelegate
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if let title = node.label.text {
                let ud = UserDefaults.standard
                ud.set(title, forKey: "genre")
                self.performSegue(withIdentifier: "toQuiz", sender: nil)
                /*
                switch title {
                case "テニス":
                    self.performSegue(withIdentifier: "toQuiz", sender: nil)
                case "サッカー":
                    self.performSegue(withIdentifier: "toQuiz", sender: nil)
                case "野球":
                    self.performSegue(withIdentifier: "toBaseball", sender: nil)
                case "バドミントン":
                    self.performSegue(withIdentifier: "toBadminton", sender: nil)
                case "合唱・アカペラ":
                    self.performSegue(withIdentifier: "toChorus", sender: nil)
                case "オーケストラ":
                    self.performSegue(withIdentifier: "toChorus", sender: nil)
                case "演劇":
                    self.performSegue(withIdentifier: "toChorus", sender: nil)
                default:
                    break
                }*/
            }
        }
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        
    }
    
    // MARK: - Private
    
    
}
