//
//  HelpSearchBar.swift
//  Bank
//
//  Created by lieon on 16/8/2.
//  Copyright © 2016年 ChangHongCloudTechService. All rights reserved.
//

import UIKit

class HelpSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        placeholder = "有问题? 请点我搜索"
        barTintColor = UIColor.whiteColor()
        backgroundImage = UIImage()
        if let textfield = valueForKey("searchField") as? UITextField {
            textfield.borderStyle = .RoundedRect
            textfield.tintColor =  UIColor.blackColor()
            textfield.backgroundColor = UIColor.greenColor()
        }
        tintColor = UIColor.blueColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
