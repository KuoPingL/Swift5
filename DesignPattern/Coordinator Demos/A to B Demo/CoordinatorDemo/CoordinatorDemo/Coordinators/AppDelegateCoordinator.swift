//
//  AppDelegateCoordinator.swift
//  CoordinatorDemo
//
//  Created by Jimmy on 2019/9/24.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit

class AppDelegateCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    // Item Receiver : Triggeres when item has been selected in Class B
    private weak var itemReceiverDelegate: ItemReceiverDelegate?
    private lazy var rootViewController: UINavigationController = {
        let nv = UINavigationController()
        nv.isNavigationBarHidden = true
        return nv
    }()
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func start() {
        showItemReceiver()
    }
    
    private func showItemReceiver() {
        let a = ClassA(delegate: self)
        itemReceiverDelegate = a
        rootViewController.viewControllers = [a]
    }
}

extension AppDelegateCoordinator: ItemSelectorDelegate {
    func didSelectItem(_ item: Item, from coordinator: Coordinator) {
        itemReceiverDelegate?.didReceiveItem(item)
        self.removeChildCoordinator(coordinator)
    }
}


extension AppDelegateCoordinator: ItemReceiverPresenter {
    func presentSelectorView() {
        let nextCoordinator = ItemSelectorCoordinator(rootViewController: rootViewController)
        self.addChildCoordinator(nextCoordinator)
        nextCoordinator.itemSelectorDelegate = self
        nextCoordinator.start()
    }
}
