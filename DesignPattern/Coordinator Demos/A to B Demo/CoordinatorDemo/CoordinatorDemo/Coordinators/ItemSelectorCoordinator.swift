//
//  ItemSelectorCoordinator.swift
//  CoordinatorDemo
//
//  Created by Jimmy on 2019/9/24.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit

class ItemSelectorCoordinator: Coordinator {
    
    public weak var itemSelectorDelegate: ItemSelectorDelegate?
    
    var childCoordinators: [Coordinator] = []
    
    private var rootViewController: UINavigationController!
    
    private var classB: ClassB?
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        if classB == nil {
            classB = ClassB(items: Item.list, delegate: self)
            classB?.itemSelectorDelegate = self
        }
        self.rootViewController.present(classB!, animated: true, completion: nil)
    }
}

extension ItemSelectorCoordinator: ItemSelectorDelegate {
    func didSelectItem(_ item: Item) {
        itemSelectorDelegate?.didSelectItem(item, from: self)
        self.classB?.dismiss(animated: true, completion: nil)
    }
}
