//
//  SplitViewTestTests.swift
//  SplitViewTestTests
//
//  Created by Daniel Hjärtström on 2020-02-21.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import XCTest
@testable import SplitViewTest

class SplitViewTestTests: XCTestCase {

    func testSelectMonster() {
        let model = MonsterViewModel(monsters: MockData.monsters) 
    
        for monster in model.monsters {
            XCTAssertTrue(monster.isSelected == false)
        }

        model.setSelectedMonster(IndexPath(item: 2, section: 0))
        
        XCTAssertTrue(model.monsters[2].isSelected)
        
        model.monsters.clearSelected()
        
        for monster in model.monsters {
            XCTAssertTrue(monster.isSelected == false)
        }
        
    }

}
