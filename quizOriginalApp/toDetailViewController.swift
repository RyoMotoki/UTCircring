//
//  toDetailViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/03/26.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

import NCMB

import SDWebImage

import TTTAttributedLabel

import FontAwesomeKit


class toDetailViewController: UIViewController, TTTAttributedLabelDelegate {
    
    var circle: NCMBObject!
    
    @IBOutlet weak var deT: UILabel!
    @IBOutlet weak var acT: UILabel!
    @IBOutlet weak var unT: UILabel!
    @IBOutlet weak var maT: UILabel!
    @IBOutlet weak var raT: UILabel!
    @IBOutlet weak var woT: UILabel!
    @IBOutlet weak var hoT: UILabel!
    @IBOutlet weak var adT: UILabel!
    
    
    
    
    @IBOutlet weak var toDetailTextView: UITextView!
    // @IBOutlet weak var circleNameLabel: UILabel!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var rateUniLabel: UILabel!
    @IBOutlet weak var manLabel: UILabel!
    @IBOutlet weak var snsLabel: TTTAttributedLabel!
    @IBOutlet weak var accessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        snsLabel.delegate = self
        snsLabel.enabledTextCheckingTypes = NSTextCheckingResult.CheckingType.link.rawValue
        
        
        self.deT.attributedText = FAKFontAwesome.pencilIcon(withSize: 15).attributedString()
        self.unT.attributedText = FAKFontAwesome.universityIcon(withSize: 14).attributedString()
        self.maT.attributedText = FAKFontAwesome.maleIcon(withSize: 15).attributedString()
        self.raT.attributedText = FAKFontAwesome.pieChartIcon(withSize: 17).attributedString()
        self.woT.attributedText = FAKFontAwesome.femaleIcon(withSize: 15).attributedString()
        self.hoT.attributedText = FAKFontAwesome.homeIcon(withSize: 16).attributedString()
        self.adT.attributedText = FAKFontAwesome.addressBookOIcon(withSize: 15).attributedString()
        
        
        let circleName = circle.object(forKey: "circleName") as? String
        let detail = circle.object(forKey: "detail") as? String
        let circleI = circle.object(forKey: "image") as? String
        let active = circle.object(forKey: "activeDate") as? String
        let rateUni = circle.object(forKey: "rateUniversity") as? String
        let man = circle.object(forKey: "manWoman") as? String
        let sns = circle.object(forKey: "sns") as? String
        let access = circle.object(forKey: "address") as? String
        if circleI != nil {
            circleImage.sd_setImage(with: URL(string: circleI!))
        } else {
            circleImage.image = UIImage(named: "")
        }
        
        activeLabel.text = active
        rateUniLabel.text = rateUni
        manLabel.text = man
        snsLabel.text = sns
        accessLabel.text = access
        // circleNameLabel.text = circleName
        self.navigationItem.title = circleName
        toDetailTextView.text = detail

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webViewController = segue.destination as! webViewController
        webViewController.webUrl = snsLabel.text!
    }
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        performSegue(withIdentifier: "next", sender: nil)
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
