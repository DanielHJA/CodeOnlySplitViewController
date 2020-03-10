//
//  DetailViewController.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-02-21.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class MonsterDetailViewController: UIViewController {
    
    var monster: Monster? {
        didSet {
            imageView.image = monster?.icon
        }
    }
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFit
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        temp.heightAnchor.constraint(equalTo: temp.widthAnchor).isActive = true
        temp.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        temp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MonsterDetailViewController: MonsterSelectionDelegate {
    func didSelectMonster(_ monster: Monster) {
        self.monster = monster
    }
}
