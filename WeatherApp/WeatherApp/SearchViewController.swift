//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by 조재흥 on 03/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchHelp = "도시, 우편번호 또는 공항 위치 입력"
        self.navigationItem.prompt = searchHelp
        let searchBar = LocationSearchBar()
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
}
