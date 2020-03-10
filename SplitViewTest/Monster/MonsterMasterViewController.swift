//
//  MasterViewController.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-02-21.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

protocol MonsterSelectionDelegate: class {
    func didSelectMonster(_ monster: Monster)
}

class MonsterMasterViewController: UITableViewController {
    
    weak var delegate: MonsterSelectionDelegate?
    weak var detailViewController: MonsterDetailViewController?

    let monsters = [
      Monster(name: "Cat-Bot", description: "MEE-OW",
              iconName: "meetcatbot", weapon: .sword),
      Monster(name: "Dog-Bot", description: "BOW-WOW",
              iconName: "meetdogbot", weapon: .blowgun),
      Monster(name: "Explode-Bot", description: "BOOM!",
              iconName: "meetexplodebot", weapon: .smoke),
      Monster(name: "Fire-Bot", description: "Will Make You Steamed",
              iconName: "meetfirebot", weapon: .ninjaStar),
      Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
              iconName: "meeticebot", weapon: .fire),
      Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
              iconName: "meetminitomatobot", weapon: .ninjaStar)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let monster = monsters[indexPath.row]
        cell.accessoryType = monster.isSelected ? .checkmark : .none
        cell.textLabel?.text = monster.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let monster = monsters[indexPath.row]
        delegate?.didSelectMonster(monster)
        self.splitViewController?.toggleMasterView()
        monsters.clearSelected()
        monster.isSelected = true
        tableView.reloadData()
        
        if UIDevice.isPhone {
            guard let detailViewController = detailViewController else { return }
            showDetailViewController(detailViewController, sender: nil)
        }
    }
    
}
