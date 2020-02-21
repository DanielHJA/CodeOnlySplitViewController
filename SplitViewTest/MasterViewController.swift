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

class MasterViewController: UITableViewController {
    
    weak var delegate: MonsterSelectionDelegate?

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
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            if let scene = UIApplication.shared.connectedScenes.first {
                if let delegate = scene.delegate as? SceneDelegate {
                    showDetailViewController(delegate.detailViewController, sender: self)
                }
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UISplitViewController {
    func toggleMasterView() {
        let barButtonItem = displayModeButtonItem
        guard let action = barButtonItem.action else { return }
        guard let target = barButtonItem.target else { return }
        UIApplication.shared.sendAction(action, to: target, from: nil, for: nil)
    }
}

extension Array where Element : Selectable {
    func clearSelected() {
        self.forEach { $0.isSelected = false }
    }
}
