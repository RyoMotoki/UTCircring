//
//  BorderButton.swift
//  quizOriginalApp
//
//  Created by Masuhara on 2017/08/16.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

@IBDesignable

class BorderButton: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
