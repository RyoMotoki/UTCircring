//
//  BorderTextField.swift
//  SNSSample
//
//  Created by Masuhara on 2017/07/28.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit

@IBDesignable

class BorderTextField: UITextField {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = borderColor.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
            
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
