//
//  CoordinatorB.swift
//  CoordinatorDemo
//
//  Created by Jimmy on 2019/9/24.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit

class ClassB: UIViewController {
    
    //MARK: Var & Let
    public weak var itemSelectorDelegate: ItemSelectorDelegate?
    private let cellID = "cellID"
    private var items: [Item] = []
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    //MARK:- Functions
    init(items: [Item], delegate: ItemSelectorDelegate?) {
        super.init(nibName: nil, bundle: nil)
        self.itemSelectorDelegate = delegate
        self.items = items
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI() {
        self.view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}

extension ClassB: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = items[indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelectorDelegate?.didSelectItem(items[indexPath.row])
    }
}
