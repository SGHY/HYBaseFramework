//
//  HYBaseViewController.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/5.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    typealias HYHandleBlock = (_ itmeTitle:String) -> Void
    
    var leftHandBlock:HYHandleBlock?
    var rightHandBlock:HYHandleBlock?
    
    func HY_setUpNavLeftItem(title:String,handBlock:@escaping HYHandleBlock) -> Void {
        self.HY_setUpNavItem(title: title, leftFlag: true, handBlock: handBlock)
    }
    
    func HY_setUpNavRightItem(title:String,handBlock:@escaping HYHandleBlock) -> Void {
        self.HY_setUpNavItem(title: title, leftFlag: false, handBlock: handBlock)
    }
    
     func HY_setUpNavItem(title:String,leftFlag:Bool,handBlock:@escaping HYHandleBlock) -> Void {
        if title.length == 0 {
            if leftFlag == true{
                self.navigationItem.leftBarButtonItem = nil
            }else{
                self.navigationItem.rightBarButtonItem = nil
            }
        }else{
            if leftFlag == true{
                self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: title, style: UIBarButtonItem.Style.plain, target: self, action: #selector(HY_navItemLeftHandle(item:)))
                leftHandBlock = handBlock
            }else{
                
                self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title:title, style: UIBarButtonItem.Style.plain, target: self, action: #selector(HY_navItemRightHandle(item:)))
                rightHandBlock = handBlock
            }
        }
    }
    @objc func HY_navItemLeftHandle(item:UIBarButtonItem) -> Void {
        if leftHandBlock != nil {
            leftHandBlock?(item.title!)
        }
    }
    @objc func HY_navItemRightHandle(item:UIBarButtonItem) -> Void {
        if rightHandBlock != nil {
            rightHandBlock?(item.title!)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
