//
//  DGCatalogNodeRepresenter.swift
//  DGCatalog
//
//  Created by Xiao Jin on 9/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit

public protocol DGCatalogNodeRepresenter {

    func navigate(_ node: DGCatalogNode, from viewController: DGCatalogTableViewController)

}
