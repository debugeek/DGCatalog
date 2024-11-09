//
//  DGCatalogTableViewController.swift
//  DGCatalog
//
//  Created by Xiao Jin on 9/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit

open class DGCatalogTableViewController: UITableViewController {

    private(set) var node: DGCatalogNode?

    public func reloadData(with node: DGCatalogNode) {
        self.node = node
        tableView.reloadData()
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return node?.children.count ?? 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let node = node?.children[indexPath.row] as? DGCatalogNode else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = node.name
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let node = node?.children[indexPath.row] as? DGCatalogNode else {
            return
        }

        tableView.deselectRow(at: indexPath, animated: true)

        node.representer?.navigate(node, from: self)
    }

}
