//
//  NoStoryboardAppDelegate.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 15.03.18.
//

import Foundation

open class NoStoryBoardAppDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?
    
    public func show(rootViewController: UIViewController) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}
