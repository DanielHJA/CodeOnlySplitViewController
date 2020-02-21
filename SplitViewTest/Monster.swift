//
//  Monster.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-02-21.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

protocol Selectable: class {
    var isSelected: Bool { get set }
}

enum Weapon {
    case blowgun, ninjaStar, fire, sword, smoke
    
    var image: UIImage {
        switch self {
        case .blowgun:
            return UIImage(named: "blowgun")!
        case .fire:
            return UIImage(named: "fire")!
        case .ninjaStar:
            return UIImage(named: "ninjastar")!
        case .smoke:
            return UIImage(named: "smoke")!
        case .sword:
            return UIImage(named: "sword")!
        }
    }
}

class Monster: Selectable {
    
    let name: String
    let description: String
    let iconName: String
    let weapon: Weapon
    var isSelected = false
    
    init(name: String, description: String, iconName: String, weapon: Weapon) {
        self.name = name
        self.description = description
        self.iconName = iconName
        self.weapon = weapon
    }
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
}
