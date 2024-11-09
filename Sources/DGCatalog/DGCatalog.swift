//
//  DGCatalog.swift
//  DGCatalog
//
//  Created by Xiao Jin on 9/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import Foundation

open class DGCatalog {

    let DGCatalogNodeIdentifierRoot = ""
    public let root: DGCatalogNode

    private var nodes = [String: DGCatalogNode]()
    private var nodeRepresenters = [String: DGCatalogNodeRepresenter]()

    public init() {
        root = DGCatalogNode(identifier: DGCatalogNodeIdentifierRoot, options: .root, name: "")
        nodes[DGCatalogNodeIdentifierRoot] = root
    }

    public func registerNodeRepresenter(_ nodeRepresenter: DGCatalogNodeRepresenter, for identifier: String) {
        nodeRepresenters[identifier] = nodeRepresenter
    }

    @discardableResult
    public func addNode(name: String, identifier: String, parentIdentifier: String?, options: DGCatalogNode.Options) -> Bool {
        let parentIdentifier = parentIdentifier ?? DGCatalogNodeIdentifierRoot
        guard let parent = nodes[parentIdentifier] else {
            return false
        }
        let node = DGCatalogNode(identifier: identifier, options: options, name: name)
        node.representer = nodeRepresenters[identifier]
        parent.addChild(node)
        nodes[identifier] = node

        return true
    }
}
