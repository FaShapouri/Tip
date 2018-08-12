//
//  Constants.swift
//  TipSy
//
//  Created by Fatemeh on 8/12/18.
//  Copyright © 2018 Fa. All rights reserved.
//

import Foundation
import UIKit

struct App {
    
    static let version     = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
    static let build     = Bundle.main.infoDictionary!["CFBundleVersion"]!
}


@objcMembers
class FSColor:NSObject{
    
    static let PrimaryColor                 = UIColor(netHex: 0xBA99D5)
    static let GradientLight                = UIColor(netHex: 0xC579FF)
    static let GradientDark                 = UIColor(netHex: 0x7E00DF)
    
}

struct Fixed {
    
    static let CornerRadius: CGFloat  = CGFloat(20.0)
}


typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)
enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
    
    var startPoint : CGPoint {
        return points.startPoint
    }
    
    var endPoint : CGPoint {
        return points.endPoint
    }
    
    var points : GradientPoints {
        get {
            switch(self) {
            case .topRightBottomLeft:
                return (CGPoint(x: 0.0,y: 1.0), CGPoint(x: 1.0,y: 0.0))
            case .topLeftBottomRight:
                return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 1,y: 1))
            case .horizontal:
                return (CGPoint(x: 0.0,y: 0.5), CGPoint(x: 1.0,y: 0.5))
            case .vertical:
                return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 0.0,y: 1.0))
            }
        }
    }
}
