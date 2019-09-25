//
//  ItemSelectorDelegate.swift
//  CoordinatorDemo
//
//  Created by Jimmy on 2019/9/24.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit
protocol ItemSelectorDelegate: class {
    func didSelectItem(_ item: Item)
    func didSelectItem(_ item: Item, from coordinator: Coordinator)
}

extension ItemSelectorDelegate {
    func didSelectItem(_ item: Item) {}
    func didSelectItem(_ item: Item, from coordinator: Coordinator) {}
}
