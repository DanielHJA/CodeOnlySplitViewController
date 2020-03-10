//
//  Extensions.swift
//  SplitViewTest
//
//  Created by Daniel Hjärtström on 2020-03-10.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

extension UISplitViewController {
    func toggleMasterView() {
        guard let action = displayModeButtonItem.action else { return }
        guard let target = displayModeButtonItem.target else { return }
        UIApplication.shared.sendAction(action, to: target, from: nil, for: nil)
    }
}

extension Array where Element : Selectable {
    func clearSelected() {
        forEach { $0.isSelected = false }
    }
}

extension SceneDelegate {
    static func current() -> SceneDelegate? {
        if let scene = UIApplication.shared.connectedScenes.first {
            if let delegate = scene.delegate as? SceneDelegate {
                return delegate
            }
        }
        return nil
    }
}

extension UIDevice {
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
