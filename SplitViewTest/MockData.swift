//
//  MockData.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-03-11.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class MockData: NSObject {
    
    static var monsters: [Monster] = {
        return [
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
    }()
    
}
