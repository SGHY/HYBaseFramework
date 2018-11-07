//
//  ViewController.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/5.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit
import SwiftyRSA

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://is.snssdk.com/article/category/get_extra/v1/"
        let param = ["device_id":"1111","iid":"1"]

        HYAFSNetwork.shareAFSNetwork.GET(url: url, param: param, successBlock: { (json) in
            if let dataDict = json["data"].dictionary {
                if let datas = dataDict["data"]?.arrayObject {
                    var models = [HYTestModel]()
                    models += datas.compactMap({ HYTestModel.deserialize(from: $0 as? Dictionary) })
                    let mo:HYTestModel = models.first!
                    print(mo.name!)
                }
            }
        }) { (errorInfo) in

        }
        
        let dic = ["merCode":"123456","merName":"天天向上"]
        HYUserInfoManager.sharedManager.didLoginInWithUserInfo(userInfo: dic as AnyObject)
        
        let user = HYUserInfoManager.sharedManager.currentUserInfo()
        print(user.merCode ?? "")
    }
}

