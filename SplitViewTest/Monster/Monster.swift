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

enum Weapon: String, Decodable {
    case blowgun = "blowgun"
    case ninjaStar = "ninjaStar"
    case fire = "fire"
    case sword = "sword"
    case smoke = "smoke"
    
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

class Monster: Selectable, Decodable {
    
    let name: String
    let description: String
    let iconName: String
    let weapon: Weapon
    var isSelected = false
    
    lazy var descriptionString: String = {
          return "This is \(name). He is wielding a \(weapon)"
      }()
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case iconName = "iconName"
        case weapon = "weapon"
        case isSelected = "isSelected"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        iconName = try container.decode(String.self, forKey: .iconName)
        weapon = try container.decode(Weapon.self.self, forKey: .weapon)
    }
    
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
