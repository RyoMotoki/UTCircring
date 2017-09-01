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
        
        magnetic.addChild(tennis)
        magnetic.addChild(soccer)
        magnetic.addChild(baseball)
        
        circleBubbleView.presentScene(magnetic)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.explainLabel.alpha = 1.0
        }) { (finished) in
            if finished == true {
                UIView.animate(withDuration: 1.0, animations: {
                    self.explainLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 200)
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
                switch title {
                case "テニス":
                    self.performSegue(withIdentifier: "toTennis", sender: nil)
                case "サッカー":
                    self.performSegue(withIdentifier: "toFootball", sender: nil)
                case "野球":
                    self.performSegue(withIdentifier: "toBaseball", sender: nil)
                default:
                    break
                }
            }
        }
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        
    }
    
    // MARK: - Private

    
}
