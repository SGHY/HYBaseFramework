//
//  HYBaseTableViewController.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/7.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYBaseTableViewController: HYBaseViewController,UITableViewDelegate,UITableViewDataSource {
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.responds(to: #selector(HY_numberOfRowsInSection(section:))){
            return self.HY_numberOfRowsInSection(section: section)
        }
        return 0
    }
    
    //尾部高
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if self.responds(to: #selector(HY_sectionFooterHeightAtSection(section:))){
            return self.HY_sectionFooterHeightAtSection(section: section)
        }
        return 0.000001
    }
    //尾部视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if self.responds(to: #selector(HY_footerAtSection(section:))){
            return self.HY_footerAtSection(section: section)
        }
        return nil
    }
    
    //头部高
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.responds(to: #selector(HY_sectionHeaderHeightAtSection(section:))){
            return self.HY_sectionHeaderHeightAtSection(section: section)
        }
        return 0.000001
    }
    //头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if self.responds(to: #selector(HY_headerAtSection(section:))){
            return self.HY_headerAtSection(section: section)
        }
        return nil
    }
    
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.responds(to: #selector(HY_cellheightAtIndexPath(indexPath:))){
            return self.HY_cellheightAtIndexPath(indexPath: indexPath)
        }
        return 0.000001
    }
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.responds(to: #selector(HY_cellAtIndexPath(indexPath:))){
            return self.HY_cellAtIndexPath(indexPath: indexPath)
        }
        return UITableViewCell()
    }
    //选中cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.responds(to: #selector(HY_didSelectCellAtIndexPath(indexPath:))){
            return self.HY_didSelectCellAtIndexPath(indexPath: indexPath)
        }
    }
    
    @objc func HY_numberOfRowsInSection(section:Int) -> Int {
        return 0
    }
    
    @objc func HY_footerAtSection(section: Int) -> UIView {
        return UIView()
    }
    
    @objc func HY_sectionFooterHeightAtSection(section: Int) -> CGFloat {
        return 0.000001
    }
    
    @objc func HY_headerAtSection(section: Int) -> UIView {
        return UIView()
    }
    
    @objc func HY_sectionHeaderHeightAtSection(section: Int) -> CGFloat {
        return 0.000001
    }
    
    @objc func HY_cellheightAtIndexPath(indexPath:IndexPath) -> CGFloat {
        return 0.00001
    }
    @objc func HY_cellAtIndexPath(indexPath:IndexPath) -> UITableViewCell {
        return HYBaseTableViewCell.cellWithTableView(tableView: tableView)
    }
    
    
    @objc func HY_didSelectCellAtIndexPath(indexPath:IndexPath) -> Void {
        
    }
    
    
    
    var dataArr = [AnyObject]()
    
    lazy var tableView:UITableView = {
        let tab = UITableView.init(frame: view.bounds, style: UITableView.Style.plain)
        tab.dataSource = self as UITableViewDataSource
        tab.delegate = self as UITableViewDelegate
        tab.backgroundColor = kMainBackgroundColor
        tab.separatorColor = kSeperatorColor
        
        return tab
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    deinit {
        print("deinit----------"+self.className)
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
