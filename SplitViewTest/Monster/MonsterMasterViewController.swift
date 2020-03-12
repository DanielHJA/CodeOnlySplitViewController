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

class MonsterMasterViewController: BaseMasterTableViewController<Monster, MonsterSelectionDelegate, MonsterDetailViewController, MonsterViewModel> {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.objects = MockData.monsters
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let monster = viewModel.objects[indexPath.row]
        cell.accessoryType = monster.isSelected ? .checkmark : .none
        cell.textLabel?.text = monster.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let monster = viewModel.objects[indexPath.row]
        delegate?.didSelectMonster(monster)
        self.splitViewController?.toggleMasterView()
        viewModel.setSelectedMonster(indexPath)
        tableView.reloadData()
        
        if UIDevice.isPhone {
            guard let detailViewController = detailViewController else { return }
            showDetailViewController(detailViewController, sender: nil)
        }
    }
    
}
