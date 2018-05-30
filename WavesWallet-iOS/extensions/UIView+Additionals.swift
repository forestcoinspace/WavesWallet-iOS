//
//  UIView+Additionals.swift
//  WavesWallet-iOS
//
//  Created by Pavel Gubin on 4/26/18.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addTableCellShadowStyle() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.15
        layer.cornerRadius = 3
    }
    
    class func loadView() -> UIView {
        let clsName = String(describing: self)
        return Bundle.main.loadNibNamed(clsName, owner: nil, options: nil)!.last! as! UIView
    }
    
    func shakeView() {
        let anim = CAKeyframeAnimation.init(keyPath: "transform")
        anim.values = [NSValue.init(caTransform3D: CATransform3DMakeTranslation(-7.0, 0.0, 0.0)),
                       NSValue.init(caTransform3D:CATransform3DMakeTranslation(7.0, 0.0, 0.0))]
        anim.autoreverses = true
        anim.repeatCount = 2.0
        anim.duration = 0.07
        layer.add(anim, forKey: nil)
    }
}