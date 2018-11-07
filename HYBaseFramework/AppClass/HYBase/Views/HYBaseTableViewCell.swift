
//
//  HYBaseTableViewCell.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/7.
//  Copyright © 2018 moovpay. All rights reserved.
//

import UIKit

class HYBaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    lazy var tableView:UITableView = {
        let version = UIDevice.current.systemVersion.floatValue()
        
        if version >= 7.0{
            return self.superview?.superview as! UITableView
        }else{
            return self.superview as! UITableView
        }
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = UIColor.clear
    }
    
    static func cellWithTableView(tableView:UITableView) -> HYBaseTableViewCell {
        let reuseIdentifierId = NSStringFromClass(self.classForCoder()) + "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierId)
        if cell == nil {
            cell = HYBaseTableViewCell.init(style: .default, reuseIdentifier: reuseIdentifierId)
        }
        return cell as! HYBaseTableViewCell
    }
    
   static func nibCellWithTableView(tableView:UITableView) -> HYBaseTableViewCell {
        let reuseIdentifierId = NSStringFromClass(self.classForCoder()) + "cellId"
        var className = NSStringFromClass(self.classForCoder())
        if(className.contains(".")){
            className = className.components(separatedBy: ".")[1];
        }
        let nib = UINib.init(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifierId)
    return tableView.dequeueReusableCell(withIdentifier: reuseIdentifierId) as! HYBaseTableViewCell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
