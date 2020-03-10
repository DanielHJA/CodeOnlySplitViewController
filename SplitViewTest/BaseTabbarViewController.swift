//
//  BaseTabbarViewController.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-03-09.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class BaseTabbarViewController: UITabBarController, UISplitViewControllerDelegate {
    
    // MARK: - Group 1
    let m1Master = MonsterMasterViewController()
    let m1Detail = MonsterDetailViewController()
    
    // MARK: - Group 2
    let m2Master = MonsterMasterViewController()
    let m2Detail = MonsterDetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGroupOne()
        configureGroupTwo()
        configureViewControllers()
    }
    
    private func configureGroupOne() {
        m1Master.detailViewController = m1Detail
        m1Master.delegate = m1Detail
        if !UIDevice.isPhone {
            let firstMonster = m1Master.monsters.first
            firstMonster?.isSelected = true
            m1Detail.monster = firstMonster
        }
    }
    
    private func configureGroupTwo() {
        m2Master.detailViewController = m2Detail
        m2Master.delegate = m2Detail
    }
    
    private func configureViewControllers() {
        viewControllers = [
            configureTabbarItems(masterViewController: m1Master,
                                 detailViewController: m1Detail,
                                 title: "Page One",
                                 image: UIImage(systemName: "trash")),
            configureTabbarItems(masterViewController: m2Master,
                                 detailViewController: m2Detail,
                                 title: "Page Two",
                                 image: UIImage(systemName: "trash"))
        ]
    }
    
    private func configureTabbarItems(masterViewController: UITableViewController, detailViewController: UIViewController, title: String?, image: UIImage?) -> UISplitViewController {
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers.append(UINavigationController(rootViewController: masterViewController))
        splitViewController.viewControllers.append(detailViewController)
        splitViewController.delegate = self
        
        let unselectedImage = image?.withTintColor(.lightGray)
        let selectedImage = image?.withTintColor(.white)
        let item = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        splitViewController.tabBarItem = item
        return splitViewController
    }
    
    // Makes sure that Master is on top instead of detail when using phone
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
}
