//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by 조재흥 on 03/08/2019.
//  Copyright © 2019 Hngfu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Properties
    //MARK: IBOutlet
    @IBOutlet weak var localTableView: UITableView!
    
    //MARK: Model
    private let localManager = LocalManager()
    
    //MARK: - Methods
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocalSearchBar()
        localTableView.dataSource = self
        localTableView.delegate = self
        localTableView.register(UINib(nibName: LocalTableViewCell.nibName, bundle: nil),
                                forCellReuseIdentifier: LocalTableViewCell.identifier)
    }
    
    private func setLocalSearchBar() {
        let searchBar = LocalSearchBar()
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        localManager.search(with: searchBar.text)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localManager.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocalTableViewCell.identifier,
                                                 for: indexPath)
        guard let localTableViewCell = cell as? LocalTableViewCell else { return cell }
        localManager.perform(with: localTableViewCell.showHandler(),
                             from: indexPath.row)
        return localTableViewCell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}
