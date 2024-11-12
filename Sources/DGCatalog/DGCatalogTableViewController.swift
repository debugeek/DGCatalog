//
//  DGCatalogTableViewController.swift
//  DGCatalog
//
//  Created by Xiao Jin on 9/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit

open class DGCatalogTableViewController: UITableViewController {

    var searchController: UISearchController!

    open override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        tableView.tableHeaderView = searchController.searchBar
    }

    private(set) var node: DGCatalogNode?
    private var filteredNodes: [DGCatalogNode]?

    public func reloadData(with node: DGCatalogNode) {
        self.node = node
        self.filteredNodes = node.children
        tableView.reloadData()
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNodes?.count ?? 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let node = filteredNodes?[indexPath.row] else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = node.name
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let node = filteredNodes?[indexPath.row] else {
            return
        }

        node.representer?.navigate(node, from: self)

        searchController.dismiss(animated: true)
    }

}

extension DGCatalogTableViewController: UISearchResultsUpdating {

    public func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            filteredNodes = node?.children
            tableView.reloadData()
            return
        }

        filteredNodes = node?.children.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }

}
