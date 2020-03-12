//
//  BaseDetailViewController.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-03-12.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

protocol Detailprotocol {
    associatedtype T
    var object: T? { get set }
}

class BaseDetailViewController<T: Decodable>: UIViewController, Detailprotocol {

    var object: T?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}
