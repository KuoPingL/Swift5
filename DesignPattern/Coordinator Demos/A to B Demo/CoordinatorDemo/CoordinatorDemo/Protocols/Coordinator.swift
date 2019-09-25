//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Jimmy on 2019/9/24.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] {get set}
    func start()
}

extension Coordinator {
    func removeChildCoordinator(_ child: Coordinator) {
        childCoordinators = childCoordinators.filter({$0 !== child})
    }
    
    func addChildCoordinator(_ child: Coordinator) {
        removeChildCoordinator(child)
        childCoordinators.append(child)
    }
}
