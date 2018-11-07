//
//  HYGlobalMethod.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/5.
//  Copyright © 2018 moovpay. All rights reserved.
//

import Foundation
import UIKit

// MARK: -------------------------- 偏好 --------------------------
func SaveInfoForKey(_ value:String ,_ Key:String) {
    UserDefaults.standard.set(value, forKey: Key)
    UserDefaults.standard.synchronize()
}
func GetInfoForKey(_ Key:String) -> Any! {
    return UserDefaults.standard.object(forKey: Key)
}
func RemoveObjectForKey(_ Key:String){
    UserDefaults.standard.removeObject(forKey: Key)
    UserDefaults.standard.synchronize()
}

// MARK: -------------------------- 输出 --------------------------
// 带方法名、行数
func printLog<T>(_ message:T,method:String = #function,line:Int = #line){
    print("-[method:\(method)] " + "[line:\(line)] " + "\(message)")
}
// 只在Debug下输出，为了给习惯OC输出写法的同事
func DLog(_ format: String, method:String = #function,line:Int = #line,_ args: CVarArg...){
    //    print("-[method:\(method)] " + "[line:\(line)] ", separator: "", terminator: "")
    #if DEBUG
    let va_list = getVaList(args)
    NSLogv(format, va_list)
    #else
    #endif
}
// 只在Debug下输出，为了为习惯PHP输出写法的同事
func echo(_ format: String,_ args: CVarArg...) {
    #if DEBUG
    let va_list = getVaList(args)
    NSLogv(format, va_list)
    #else
    #endif
}

// MARK: 截屏
/// 获得截屏视图（无值获取当前Window）
func ScreenCapture(_ view:UIView? = nil, _ isSave:Bool = false) ->UIImage {
    
    let captureView = (view ?? (UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first))!
    
    UIGraphicsBeginImageContextWithOptions(captureView.frame.size, false, 0.0)
    
    captureView.layer.render(in: UIGraphicsGetCurrentContext()!)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    if isSave { UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil) }
    
    return image!
}

// MARK: -- 创建分割线
/// 给一个视图创建添加一条分割线 高度 : HJSpaceLineHeight
func SpaceLineSetup(view:UIView, color:UIColor? = nil) ->UIView {
    
    let spaceLine = UIView()
    
    spaceLine.backgroundColor = color != nil ? color : UIColor.lightGray
    
    view.addSubview(spaceLine)
    
    return spaceLine
}

// MARK: -- 获取时间
/// 获取当前时间传入 时间格式 "YYYY-MM-dd-HH-mm-ss"
func GetCurrentTimerString(dateFormat:String) ->String {
    
    let dateformatter = DateFormatter()
    
    dateformatter.dateFormat = dateFormat
    
    return dateformatter.string(from: Date())
}

/// 将 时间 根据 类型 转成 时间字符串
func GetTimerString(dateFormat:String, date:Date) ->String {
    
    let dateformatter = DateFormatter()
    
    dateformatter.dateFormat = dateFormat
    
    return dateformatter.string(from: date)
}

/// 获取当前的 TimeIntervalSince1970 时间字符串
func GetCurrentTimeIntervalSince1970String() -> String {
    
    return String(format: "%.0f",Date().timeIntervalSince1970)
}

// MARK: -- 创建文件夹
/// 创建文件夹 如果存在则不创建
func CreatFilePath(_ filePath:String) ->Bool {
    
    let fileManager = FileManager.default
    
    // 文件夹是否存在
    if fileManager.fileExists(atPath: filePath) {
        
        return true
    }
    
    do{
        try fileManager.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
        
        return true
        
    }catch{}
    
    return false
}
// MARK: -- 文件链接处理
/// 文件类型
func GetFileExtension(_ url:URL) ->String {
    
    return url.path.pathExtension()
}

/// 文件名称
func GetFileName(_ url:URL) ->String {
    
    return url.path.lastPathComponent().stringByDeletingPathExtension()
}


// MARK: -- 阅读页面获取文件方法

/// 主文件夹名称
private let ReadFolderName:String = "DZMeBookRead"

/// 归档阅读文件文件
func ReadKeyedArchiver(folderName:String,fileName:String,object:AnyObject) {
    
    var path = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!) + "/\(ReadFolderName)/\(folderName)"
    
    if (CreatFilePath(path)) { // 创建文件夹成功或者文件夹存在
        
        path = path + "/\(fileName)"
        
        NSKeyedArchiver.archiveRootObject(object, toFile: path)
    }
}

/// 解档阅读文件文件
func ReadKeyedUnarchiver(folderName:String,fileName:String) ->AnyObject? {
    
    let path = ((NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as String) + "/\(ReadFolderName)/\(folderName)") + "/\(fileName)"
    
    return NSKeyedUnarchiver.unarchiveObject(withFile: path) as AnyObject?
}

/// 删除阅读归档文件
func ReadKeyedRemoveArchiver(folderName:String,fileName:String? = nil) {
    
    var path = ((NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as String) + "/\(ReadFolderName)/\(folderName)")
    
    if fileName != nil { path +=  "/\(fileName!)" }
    
    do{
        try FileManager.default.removeItem(atPath: path)
    }catch{}
}

/// 是否存在了改归档文件
func ReadKeyedIsExistArchiver(folderName:String,fileName:String? = nil) ->Bool {
    
    var path = ((NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as String) + "/\(ReadFolderName)/\(folderName)")
    
    if fileName != nil { path +=  "/\(fileName!)" }
    
    return FileManager.default.fileExists(atPath: path)
}
