//
//  KWBlurAppView.swift
//
//  Created by Kridsanapong Wongthongdee
//  Copyright © 2016 golfiti. All rights reserved.
//

import UIKit

class KWBlurAppView: UIView {

    class var sharedInstance: KWBlurAppView {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: KWBlurAppView? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = KWBlurAppView()
        }
        return Static.instance!
    }

    private var blurEffectView = UIVisualEffectView()

    func showBlurView() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.blurEffectView.effect = UIBlurEffect(style: .Light)
            self.blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.blurEffectView.frame = (UIScreen.mainScreen().bounds)
            self.blurEffectView.alpha = 0
            self.blurEffectView.tag = 80
            if let window = UIApplication.sharedApplication().delegate?.window {
                UIView.animateWithDuration(0.0, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                }, completion: { (Bool) -> Void in
                    self.blurEffectView.alpha = 1
                    window?.addSubview(self.blurEffectView)
                })
            }
        } else {
            let blackColorView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
            blackColorView.backgroundColor = UIColor.blackColor()
            blackColorView.tag = 80
            if let window = UIApplication.sharedApplication().delegate?.window {
                window?.addSubview(blackColorView)
            }
        }
    }

    func hideBlurView() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.blurEffectView.alpha = 0
            }, completion: { (Bool) -> Void in
                self.blurEffectView.alpha = 1
                self.blurEffectView.effect = nil
                if let window = UIApplication.sharedApplication().delegate?.window {
                    if let viewWithTag = window!.viewWithTag(80) {
                        viewWithTag.removeFromSuperview()
                    }
                }
            })
        } else {
            if let window = UIApplication.sharedApplication().delegate?.window {
                if let viewWithTag = window!.viewWithTag(80) {
                    viewWithTag.removeFromSuperview()
                }
            }
        }
    }
}
