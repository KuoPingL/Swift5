//
//  ClassA.swift
//  CoordinatorDemo
//
//  Created by Jimmy on 2019/9/24.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit

class ClassA: UIViewController {
    
    public weak var itemReceiverPresenter: ItemReceiverPresenter?
    
    private var selectedItem: Item?
    
    private lazy var label: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.cornerRadius = 10
        l.layer.masksToBounds = true
        l.text = "<NONE>"
        return l
    }()
    
    private lazy var button: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(buttonDidPressed(_:)), for: .touchUpInside)
        b.setTitle("Start Selection", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        b.layer.borderColor = UIColor.black.cgColor
        b.layer.borderWidth = 2
        b.layer.shadowColor = UIColor.lightGray.cgColor
        b.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        b.setTitleColor(.black, for: .normal)
        b.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return b
    }()
    
    @objc func buttonDidPressed(_ sender: UIButton) {
        itemReceiverPresenter?.presentSelectorView()
    }
    
    init(delegate: ItemReceiverPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.itemReceiverPresenter = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
        [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.8),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ].forEach({$0.isActive.toggle()})
    }
}

extension ClassA: ItemReceiverDelegate {
    func didReceiveItem(_ item: Item) {
        label.text = item.name
    }
}
