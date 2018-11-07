//
//  UIScrollView+HYRefresh.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/7.
//  Copyright © 2018 moovpay. All rights reserved.
//
import Foundation
import UIKit
import MJRefresh

extension UIScrollView {
    typealias HYRefreshBlock = ()-> Void

    //下拉刷新
    func addRefresh(headerBlock:@escaping HYRefreshBlock) -> Void {
        let header = MJRefreshNormalHeader()
        header.setTitle("释放更新", for: .pulling)
        header.setTitle("正在更新", for: .refreshing)
        header.setTitle("下拉刷新", for: .idle)
        header.stateLabel.font = UIFont.systemFont(ofSize: 13)
        header.stateLabel.textColor = UIColor.rgb(69, 74, 95)
        header.lastUpdatedTimeLabel.isHidden = true
        self.mj_header = header
        
        weak var weakSelf = self
        self.mj_header.refreshingBlock = {
            if weakSelf?.mj_footer != nil && weakSelf?.mj_footer.state == .noMoreData{
                weakSelf?.mj_footer .resetNoMoreData()
            }
            
            headerBlock()
        }
    }
    
    //上拉加载
    func addRefresh(footerBlock:@escaping HYRefreshBlock) -> Void {
        let footer = MJRefreshBackNormalFooter()
        footer.setTitle("上拉加载更多", for: .idle)
        footer.setTitle("松开立即加载", for: .pulling)
        footer.setTitle("正在为您加载数据", for: .refreshing)
        footer.setTitle("没有更多了~", for: .noMoreData)
        footer.stateLabel.textColor = UIColor.rgb(90, 90, 90)
        footer.stateLabel.font = UIFont.systemFont(ofSize: 13)
        footer.backgroundColor = UIColor.clear
        self.mj_footer = footer
        
        self.mj_footer.refreshingBlock = {
            footerBlock()
        }
    }
    
    //下拉刷新+上拉加载
    func addRefresh(headerBlock:@escaping HYRefreshBlock,footerBlock:@escaping HYRefreshBlock) -> Void {
        self.addRefresh(headerBlock: headerBlock)
        self.addRefresh(footerBlock: footerBlock)
    }
    
    //动画下拉刷新
    func addGifRefresh(headerBlock:@escaping HYRefreshBlock) -> Void {
        
    }
    
    //动画上拉加载
    func addGifRefresh(footerBlock:@escaping HYRefreshBlock) -> Void {
        
    }
    
    //动画上拉刷新+动画下拉加载
    func addGifRefresh(headerBlock:@escaping HYRefreshBlock,footerBlock:@escaping HYRefreshBlock) -> Void {
        
    }
    
    //没有更多数据
    func footerNoMoreData() -> Void {
        self.mj_footer.endRefreshingWithNoMoreData()
    }
    
    //结束刷新状态
    func headerEndRefreshing() -> Void
    {
        self.mj_header.endRefreshing()
    }
    
    func footerEndRefreshing() -> Void
    {
        mj_footer.endRefreshing()
    }
    
    func endRefreshing() -> Void
    {
        self.headerEndRefreshing()
        self.footerEndRefreshing()
    }
    
}
