//
//  ItemReceiverDelegate.swift
//  CoordinatorDemo
//
//  Created by Jimmy on 2019/9/24.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import Foundation
protocol ItemReceiverDelegate: class {
    func didReceiveItem(_ item: Item)
}

protocol ItemReceiverPresenter: class {
    func presentSelectorView()
}
