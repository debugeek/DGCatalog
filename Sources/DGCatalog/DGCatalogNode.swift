//
//  DGCatalogNode.swift
//  DGCatalog
//
//  Created by Xiao Jin on 9/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import Foundation

public class DGCatalogNode {

    public struct Options: OptionSet {
        public let rawValue: Int8

        public init(rawValue: Int8) { self.rawValue = rawValue }

        public static let none         = Options(rawValue: 0 << 0)
        public static let root         = Options(rawValue: 1 << 0)
        public static let expandable   = Options(rawValue: 1 << 1)
    }

    public let identifier: String
    public let options: Options
    public let name: String

    public private(set) weak var parent: DGCatalogNode?

    public private(set) var children = [DGCatalogNode]()

    init(identifier: String, options: Options, name: String, parent: DGCatalogNode? = nil, children: [DGCatalogNode] = [DGCatalogNode]()) {
        self.identifier = identifier
        self.options = options
        self.name = name
        self.parent = parent
        self.children = children
    }
    
    func addChild(_ node: DGCatalogNode) {
        node.parent = self
        children.append(node)
    }

    var representer: DGCatalogNodeRepresenter?

}
