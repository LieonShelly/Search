//
//  HelpCenterHomeViewController.swift
//  Bank
//
//  Created by lieon on 16/8/2.
//  Copyright © 2016年 ChangHongCloudTechService. All rights reserved.
//

import UIKit
import SnapKit

class HelpCenterHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private lazy var homeView: HelpCenterHomeView = {
        let homeView = HelpCenterHomeView()
        
        return homeView
    }()

    private lazy var searchBar: HelpSearchBar = {
        let bar = HelpSearchBar()
         bar.delegate = self
        return bar
    }()
    
    private lazy var resultTableView: HelpCenterSearchResultView = {
        let table = HelpCenterSearchResultView()
        table.hidden = true
        return table
    }()

    private func setupUI() {
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(searchBar)
        view.addSubview(homeView)
        view.addSubview(resultTableView)
        searchBar.snp_makeConstraints { (make) in
            make.top.equalTo(view.snp_top).offset(64)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(34)
        }
        resultTableView.snp_makeConstraints { (make) in
            make.top.equalTo(searchBar.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        homeView.snp_makeConstraints { (make) in
            make.top.equalTo(searchBar.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
}

extension HelpCenterHomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated:true)
        
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        resultTableView.hidden = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        resultTableView.hidden = true
        searchBar.resignFirstResponder()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.setShowsCancelButton((searchText as NSString).length > 0, animated:true)
        resultTableView.hidden = (searchText as NSString).length < 1
    }
}
