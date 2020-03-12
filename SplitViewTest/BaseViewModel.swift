//
//  BaseViewModel.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-03-12.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class BaseViewModel<T: Decodable>: NSObject {
    
    var objects: [T] = []

    required init(objects: [T] = []) { }
    
}
