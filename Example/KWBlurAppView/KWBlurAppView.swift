//
//  KWBlurAppView.swift
//
//  Created by Kridsanapong Wongthongdee
//  Copyright © 2016 golfiti. All rights reserved.
//

import UIKit

class KWBlurAppView: UIView {
    
    class var sharedInstance: KWBlurAppView {
        let instance = KWBlurAppView()
        return instance
    }
    
    private var blurEffectView = UIVisualEffectView()
    
    func showBlurView() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.blurEffectView.effect = UIBlurEffect(style: .light)
            self.blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.blurEffectView.frame = (UIScreen.main.bounds)
            self.blurEffectView.alpha = 0
            self.blurEffectView.tag = 80
            if let window = UIApplication.shared.delegate?.window {
                UIView.animate(withDuration: 0.0, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                }, completion: { (Bool) -> Void in
                    self.blurEffectView.alpha = 1
                    window?.addSubview(self.blurEffectView)
                })
            }
        } else {
            let blackColorView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
            blackColorView.backgroundColor = UIColor.black
            blackColorView.tag = 80
            if let window = UIApplication.shared.delegate?.window {
                window?.addSubview(blackColorView)
            }
        }
    }
    
    func hideBlurView() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.blurEffectView.alpha = 0
            }, completion: { (Bool) -> Void in
                self.blurEffectView.alpha = 1
                self.blurEffectView.effect = nil
                if let window = UIApplication.shared.delegate?.window {
                    if let viewWithTag = window!.viewWithTag(80) {
                        viewWithTag.removeFromSuperview()
                    }
                }
            })
        } else {
            if let window = UIApplication.shared.delegate?.window {
                if let viewWithTag = window!.viewWithTag(80) {
                    viewWithTag.removeFromSuperview()
                }
            }
        }
    }
}
