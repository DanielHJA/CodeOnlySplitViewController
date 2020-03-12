//
//  DetailViewController.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-02-21.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class MonsterDetailViewController: BaseDetailViewController<Monster> {
    
    override var object: Monster? {
        didSet {
            imageView.image = object?.icon
            label.text = object?.descriptionString
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
    
    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.black
        temp.textAlignment = .center
        temp.minimumScaleFactor = 0.7
        temp.numberOfLines = 0
        temp.adjustsFontSizeToFitWidth = true
        temp.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0).isActive = true
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MonsterDetailViewController: MonsterSelectionDelegate {
    func didSelectMonster(_ monster: Monster) {
        self.object = monster
    }
}
