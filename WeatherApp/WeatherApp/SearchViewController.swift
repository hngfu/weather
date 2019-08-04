//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by 조재흥 on 03/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var searchBar: LocationSearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.prompt = "도시, 우편번호 또는 공항 위치 입력"
        self.searchBar = LocationSearchBar()
        self.searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        self.searchBar.becomeFirstResponder()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
}
