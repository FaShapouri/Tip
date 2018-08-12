//
//  Extentions.swift
//  TipSy
//
//  Created by Fatemeh on 8/12/18.
//  Copyright © 2018 Fa. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:UInt) {
        let red = (netHex >> 16) & 0xff
        let green = (netHex >> 8) & 0xff
        let blue = netHex & 0xff
        
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHexWithAlpha netHex:Int) {
        let alpha = (netHex >> 24) & 0xff
        let red = (netHex >> 16) & 0xff
        let green = (netHex >> 8) & 0xff
        let blue = netHex & 0xff
        
        assert(alpha >= 0 && alpha <= 255, "Invalid alpha component")
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    convenience init(netHexString:String) {
        
        var hex = netHexString.replace("#", withString: "")
        
        if hex.length == 6 {
            self.init(netHex: UInt(hex, radix: 16)!)
        } else if hex.length == 3{
            let a = String(hex[0])
            let b = String(hex[1])
            let c = String(hex[2])
            
            hex = a + a + b + b + c + c
            self.init(netHex: UInt(hex, radix: 16)!)
        } else {
            self.init(netHex: UInt("F7B731", radix: 16)!)
        }
    }
}


extension String {
    
    var length: Int {
        get {
            return self.count
        }
    }
    
    subscript (i: Int) -> Character {
        get {
            let index = self.index(startIndex, offsetBy: i)
            return self[index]
        }
    }
    func replace(_ target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}

extension UIView {
    func applyGradient(colors: [UIColor], gradientOrientation orientation: GradientOrientation?) -> Void {
        if orientation != nil {
            self.applyGradient(withColors: colors, gradientOrientation: orientation!)
        }
        else {
            self.applyGradient(colors: colors, locations: nil)
        }
    }
    
    
    private func applyGradient(colors: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    private func applyGradient(withColors colours: [UIColor], gradientOrientation orientation: GradientOrientation) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        self.layer.insertSublayer(gradient, at: 0)
    }

}

