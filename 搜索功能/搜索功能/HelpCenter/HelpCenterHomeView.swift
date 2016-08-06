//
//  HelpCenterHomeView.swift
//  Bank
//
//  Created by lieon on 16/8/3.
//  Copyright © 2016年 ChangHongCloudTechService. All rights reserved.
//

import UIKit
import SnapKit

private let helpCenterHomeMainTableCellID: String = "HelpCenterHomeMainTableCell"
private let helpCenterHomeSubTableCellID: String = "HelpCenterHomeSubTableCell"

class HelpCenterHomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        mainTableView.registerClass(HelpCenterHomeMainTableCell.self, forCellReuseIdentifier: helpCenterHomeMainTableCellID)
        subTableVIew.registerClass(HelpCenterHomeSubTableCell.self, forCellReuseIdentifier: helpCenterHomeSubTableCellID)
        addSubview(mainTableView)
        addSubview(subTableVIew)
        mainTableView.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(100)
            make.bottom.equalTo(0)
        }
        subTableVIew.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(mainTableView.snp_right).offset(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    private lazy var mainTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()

    private lazy var subTableVIew: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HelpCenterHomeView: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == mainTableView {
            let  cell: HelpCenterHomeMainTableCell = HelpCenterHomeMainTableCell.cellWith(mainTableView)
            return cell
            
        } else {
            let  cell: HelpCenterHomeSubTableCell = HelpCenterHomeSubTableCell.cellWith(subTableVIew)
            return cell
        }
    }
    
}

extension HelpCenterHomeView: UITableViewDelegate {
    
}

private class HelpCenterHomeMainTableCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    class func cellWith(tableView: UITableView) -> HelpCenterHomeMainTableCell {
        guard let cell: HelpCenterHomeMainTableCell = tableView.dequeueReusableCellWithIdentifier(helpCenterHomeMainTableCellID) as? HelpCenterHomeMainTableCell else {
            return HelpCenterHomeMainTableCell()
        }
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private class HelpCenterHomeSubTableCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    class func cellWith(tableView: UITableView) -> HelpCenterHomeSubTableCell {
        guard let cell: HelpCenterHomeSubTableCell = tableView.dequeueReusableCellWithIdentifier(helpCenterHomeSubTableCellID) as? HelpCenterHomeSubTableCell else {
            return HelpCenterHomeSubTableCell()
        }
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
