//
//  UIColor+Extension.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/5.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit
extension UIColor {
    // RGB颜色
    static func rgba(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
        return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
    }
    static func rgb(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return rgba((r), (g), (b), 1)
    }
    /// 十六进制的色值 例如：0xfff000
    static func hex(_ value:Int) -> UIColor{
        return rgb(CGFloat((value & 0xFF0000) >> 16),
                   CGFloat((value & 0x00FF00) >> 8),
                   CGFloat((value & 0x0000FF)))
    }
    /// 十六进制的色值，例如：“#FF0000”，“0xFF0000”
    static func hexString(_ value:String) -> UIColor{
        var cString:String = value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        cString = cString.lowercased()
        if cString.hasPrefix("#") {
            cString = cString.substring(from: cString.index(after: cString.startIndex))
        }
        if cString.hasPrefix("0x") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        }
        if cString.lengthOfBytes(using: String.Encoding.utf8) != 6 {
            return UIColor.clear
        }
        var startIndex = cString.startIndex
        var endIndex = cString.index(startIndex, offsetBy: 2)
        let rStr = cString[startIndex..<endIndex]
        startIndex = cString.index(startIndex, offsetBy: 2)
        endIndex = cString.index(startIndex, offsetBy: 2)
        let gStr = cString[startIndex..<endIndex]
        startIndex = cString.index(startIndex, offsetBy: 2)
        endIndex = cString.index(startIndex, offsetBy: 2)
        let bStr = cString[startIndex..<endIndex]
        var r :UInt32 = 0x0;
        var g :UInt32 = 0x0;
        var b :UInt32 = 0x0;
        Scanner.init(string: String(rStr)).scanHexInt32(&r);
        Scanner.init(string: String(gStr)).scanHexInt32(&g);
        Scanner.init(string: String(bStr)).scanHexInt32(&b);
        return rgb(CGFloat(r), CGFloat(g), CGFloat(b))
    }
    /// 随机色
    static var rand: UIColor {
        return rgb(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)))
    }
}
