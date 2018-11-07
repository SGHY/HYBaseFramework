//
//  HYUserInfoManager.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/6.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYUserInfoManager: NSObject {
    static let sharedManager = HYUserInfoManager()
    
    //// 当前用户信息
    func currentUserInfo() -> HYUserInfoModel {
        
        let obj = HYFileCacheManager.getObjectByFileName(filename:NSStringFromClass(HYUserInfoModel.classForCoder()))
        return obj as! HYUserInfoModel
    }
    
    //// 登陆
    func didLoginInWithUserInfo(userInfo:AnyObject) -> Void {
        let user = HYUserInfoModel.deserialize(from: userInfo as? Dictionary)
        user?.archive()
        HYFileCacheManager.saveUser(data: "1" as AnyObject, key: HYHasLoginFlag)
    }
    
    //// 重置用户信息
    func resetUserInfoWithUserInfo(userInfo:HYUserInfoModel) -> Void {
        userInfo.archive()
    }
    
    //// 退出登陆
    func didLoginOut() -> Void {
        HYFileCacheManager.removeObjectByFileName(fileName: NSStringFromClass(HYUserInfoModel.classForCoder()))
        
        HYFileCacheManager.saveUser(data:"0" as AnyObject, key: HYHasLoginFlag)
    }
    
    //// 判断是否是登陆状态
    func isLogin() -> Bool{
        let isLo = UserDefaults.standard.string(forKey: HYHasLoginFlag)
        
        return isLo!.boolValue()
    }
}
