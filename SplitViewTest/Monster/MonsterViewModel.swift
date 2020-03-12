//
//  MonsterViewModel.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-03-11.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class MonsterViewModel: BaseViewModel<Monster> {
    
    required init(objects: [Monster]) {
        super.init(objects: objects)
    }
    
    func setSelectedMonster(_ indexPath: IndexPath) {
        let object = objects[indexPath.row]
        objects.clearSelected()
        object.isSelected = true
    }

}
