//
//  HYBaseNavigationController.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/5.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = UINavigationBar.appearance()
        
        // 设置为不透明
        navigationBar.isTranslucent = false
        
        // 设置导航栏背景颜色
        navigationBar.barTintColor = kNavBarColor
        
        // 设置导航栏标题文字颜色
        // 创建字典保存文字大小和颜色
        let dic = NSMutableDictionary.init()
        dic[NSAttributedString.Key.font] = AdaptedFontSizeValue(x: 17)
        dic[NSAttributedString.Key.foregroundColor] = kNormalFontColor
        navigationBar.titleTextAttributes = dic as? [NSAttributedString.Key : Any]
        
        // 拿到整个导航控制器的外观
        let barItem = UIBarButtonItem.appearance()
        barItem.tintColor = kNormalFontColor
        
        let atts = NSMutableDictionary.init()
        atts[NSAttributedString.Key.font] = AdaptedFontSizeValue(x: 17)
        atts[NSAttributedString.Key.foregroundColor] = kNormalFontColor
        barItem.setTitleTextAttributes(atts as? [NSAttributedString.Key : Any], for: UIControl.State.normal)
        
        navigationBar.shadowImage = UIImage.init()
        navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        /**
         *  如果在堆栈控制器数量大于1 加返回按钮
         */
        if(viewControllers.count > 0){
            viewController.hidesBottomBarWhenPushed = true
            
            let btn = UIButton.init(type:UIButton.ButtonType.custom)
            btn .setImage(UIImage.init(named: "return"), for: UIControl.State.normal)
            btn.tintColor = kNormalFontColor
            btn.addTarget(self, action:#selector(popViewController(animated:)), for: UIControl.Event.touchUpInside)
            let leftItem = UIBarButtonItem.init(customView: btn)
            
            viewController.navigationItem.leftBarButtonItem = leftItem
        }else{
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        }
        super.pushViewController(viewController, animated: animated)
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
