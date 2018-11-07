//
//  HYFileCacheManager.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/6.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYFileCacheManager: NSObject {
    // 存储用户偏好设置
    static func saveUser(data:AnyObject,key:String) -> Void {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    // 读取用户偏好设置
    static func readUserData(key:String) -> AnyObject {
        let obj = UserDefaults.standard.object(forKey: key)
        UserDefaults.standard.synchronize()
        return obj as AnyObject
    }
    
    // 删除用户偏好设置
    static func removeUserData(key:String) -> Void {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    // 把对象归档存到沙盒里
    static func saveObject(obj:AnyObject,filename:String) -> Bool {
        var path = HYFileCacheManager.appendFilePath(fileName: filename)
        path = path + ".archive"
        return NSKeyedArchiver.archiveRootObject(obj, toFile: path)
    }
    
    // 通过文件名从沙盒中找到归档的对象
    static func getObjectByFileName(filename:String) -> AnyObject {
        var path = HYFileCacheManager.appendFilePath(fileName: filename)
        path = path + ".archive"
        return NSKeyedUnarchiver.unarchiveObject(withFile: path) as AnyObject
    }
    
    // 根据文件名删除沙盒中的文件
    static func removeObjectByFileName(fileName:String) -> Void {
        var path = HYFileCacheManager.appendFilePath(fileName: fileName)
        path = path + ".archive"
        
        do{
           try  FileManager.default.removeItem(atPath: path)
        }catch{}
    }
    
    
    // 拼接文件路径并添加
    static func appendFilePath(fileName:String) -> String {
        
        let filePath:String = FileManager.cachesPath()+"/"+fileName
        if !FileManager.default.fileExists(atPath: filePath) {
            do{
                try FileManager.default.createDirectory(atPath: filePath, withIntermediateDirectories: false, attributes: nil)
            }catch{}
        }

        return filePath
    }
    
    
}
