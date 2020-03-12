//
//  BaseMasterTableViewController.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-03-12.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

struct AnyCodable: Decodable { }

protocol SplitViewControllerMasterProtocol {
    associatedtype Delegate
    associatedtype Detail
    associatedtype Model
    
    var delegate: Delegate? { get set }
    var detailViewController: Detail! { get set }
    var viewModel: Model! { get set }
}

class BaseMasterTableViewController<T: Decodable, Delegate, Detail: BaseDetailViewController<T>, Model: BaseViewModel<T>>: UITableViewController, SplitViewControllerMasterProtocol {

    var delegate: Delegate?
    var detailViewController: Detail! = Detail()
    var viewModel: Model! = Model() 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIAccessibility.setFocusTo(view)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.objects.count
    }
}
