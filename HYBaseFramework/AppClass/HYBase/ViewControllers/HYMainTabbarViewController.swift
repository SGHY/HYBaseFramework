//
//  HYMainTabbarViewController.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/5.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYMainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        
        // 设置为不透明
        tabBar.isTranslucent = false
        // 设置背景颜色
        tabBar.barTintColor = kTabBarColor
        
        // 拿到整个tabBar的外观
        let tabBarItem = UITabBarItem.appearance()
        tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: 1.5)
        
        // 普通状态
        let normalAtts = NSMutableDictionary.init()
        normalAtts[NSAttributedString.Key.font] = AdaptedFontSizeValue(x: 13)
        normalAtts[NSAttributedString.Key.foregroundColor] = kNormalTabBarFontColor
        tabBarItem.setTitleTextAttributes(normalAtts as? [NSAttributedString.Key : Any], for: UIControl.State.normal)
        
        // 选中状态
        let seletedAtts = NSMutableDictionary.init()
        seletedAtts[NSAttributedString.Key.font] = AdaptedFontSizeValue(x: 13)
        seletedAtts[NSAttributedString.Key.foregroundColor] = kSeletedTabBarFontColor
        tabBarItem.setTitleTextAttributes(seletedAtts as? [NSAttributedString.Key : Any], for: UIControl.State.selected)
    }
    func addChildViewController(_ className: String, title: String, imageName: String) -> Void {
        let vcClass = NSClassFromString(className)!as! UIViewController.Type
        let vc = vcClass.init()
        
        let nav = HYBaseNavigationController.init(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.selectedImage = UIImage.init(named: imageName+"_press")
        self.addChild(nav)
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
