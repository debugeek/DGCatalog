//
//  ViewController.swift
//  DGCatalogDemo
//
//  Created by Xiao Jin on 9/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit
import DGCatalog

class NodeRepresenter: DGCatalogNodeRepresenter {
    
    func navigate(_ node: DGCatalogNode, from viewController: DGCatalogTableViewController) {

        if node.options.contains(.expandable) {
            let targetViewController = DGCatalogTableViewController(style: .plain)
            targetViewController.reloadData(with: node)
            viewController.navigationController?.pushViewController(targetViewController, animated: true)
        } else {
            let targetViewController: UIViewController
            switch node.identifier {
            case "File 4":
                targetViewController = UIViewController()
            case "File 5":
                targetViewController = UIViewController()
            case "File 1-2", "File 1-3":
                targetViewController = UIViewController()
            case "File 2-2", "File 2-3":
                targetViewController = UIViewController()
            default: return
            }
            viewController.navigationController?.pushViewController(targetViewController, animated: true)
        }
    }

}

class ViewController: DGCatalogTableViewController {

    let nodeRepresenter = NodeRepresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        let catalog = DGCatalog()
        catalog.registerNodeRepresenter(nodeRepresenter, for: "Folder 1")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "Folder 2")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "Folder 3")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "File 4")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "File 5")

        catalog.registerNodeRepresenter(nodeRepresenter, for: "Folder 1-1")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "File 1-2")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "File 1-3")

        catalog.registerNodeRepresenter(nodeRepresenter, for: "Folder 2-1")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "File 2-2")
        catalog.registerNodeRepresenter(nodeRepresenter, for: "File 2-3")

        catalog.addNode(name: "Folder 1", identifier: "Folder 1", parentIdentifier: nil, options: .expandable)
        catalog.addNode(name: "Folder 2", identifier: "Folder 2", parentIdentifier: nil, options: .expandable)
        catalog.addNode(name: "Folder 3", identifier: "Folder 3", parentIdentifier: nil, options: .expandable)
        catalog.addNode(name: "File 4", identifier: "File 4", parentIdentifier: nil, options: .none)
        catalog.addNode(name: "File 5", identifier: "File 5", parentIdentifier: nil, options: .none)
        catalog.addNode(name: "Folder 1-1", identifier: "Folder 1-1", parentIdentifier: "Folder 1", options: .expandable)
        catalog.addNode(name: "File 1-2", identifier: "File 1-2", parentIdentifier: "Folder 1", options: .none)
        catalog.addNode(name: "File 1-3", identifier: "File 1-3", parentIdentifier: "Folder 1", options: .none)
        catalog.addNode(name: "Folder 2-1", identifier: "Folder 2-1", parentIdentifier: "Folder 2", options: .expandable)
        catalog.addNode(name: "File 2-2", identifier: "File 2-2", parentIdentifier: "Folder 2", options: .none)
        catalog.addNode(name: "File 2-3", identifier: "File 2-3", parentIdentifier: "Folder 2", options: .none)

        reloadData(with: catalog.root)
    }

}

