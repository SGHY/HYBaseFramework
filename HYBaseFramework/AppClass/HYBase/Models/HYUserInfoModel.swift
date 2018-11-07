//
//  HYUserInfoModel.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/6.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYUserInfoModel: HYBaseModel,NSCoding {
    var merCode:String?
    var merName:String?
//    var mid:String?
//    var midName:String?
//    var qrcContent:String?
//    var status:String?
//    var tid:String?
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(merCode, forKey: "merCode")
        aCoder.encode(merName, forKey: "merName")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        merCode = aDecoder.decodeObject(forKey: "merCode") as! String?
        merName = aDecoder.decodeObject(forKey: "merName") as! String?
    }
    
    required init() {
        
    }
    
    //归档
    func archive() -> Void {
        let isok = HYFileCacheManager.saveObject(obj: self, filename: NSStringFromClass(self.classForCoder))
        if isok==true {
            print("归档成功"+self.description)
        }else{
            print("归档失败"+self.description)
        }
    }
    
    //解档
    func unarchiver() -> AnyObject {
        return HYFileCacheManager.getObjectByFileName(filename: NSStringFromClass(self.classForCoder))
    }
    
    //从本地移除
    func remove() -> Void {
        HYFileCacheManager.removeObjectByFileName(fileName: NSStringFromClass(self.classForCoder))
    }
}
