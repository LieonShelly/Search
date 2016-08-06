//
//  HelpCenterSearchResultView.swift
//  Bank
//
//  Created by lieon on 16/8/3.
//  Copyright © 2016年 ChangHongCloudTechService. All rights reserved.
//

import UIKit

private let helpCenterSearchResultCellID: String = "HelpCenterSearchResultCell"

class HelpCenterSearchResultView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        alwaysBounceVertical = true
        scrollEnabled = true
        registerClass(HelpCenterSearchResultCell.self, forCellReuseIdentifier: helpCenterSearchResultCellID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension HelpCenterSearchResultView: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell: HelpCenterSearchResultCell = HelpCenterSearchResultCell.cellWith(tableView)
        cell.textLabel?.text = String(indexPath.row)
       return cell
        
    }
}

extension HelpCenterSearchResultView: UITableViewDelegate {
    
}

private class HelpCenterSearchResultCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    class func cellWith(tableView: UITableView) -> HelpCenterSearchResultCell {
        guard let cell: HelpCenterSearchResultCell = tableView.dequeueReusableCellWithIdentifier(helpCenterSearchResultCellID) as? HelpCenterSearchResultCell else {
            return HelpCenterSearchResultCell()
        }
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
