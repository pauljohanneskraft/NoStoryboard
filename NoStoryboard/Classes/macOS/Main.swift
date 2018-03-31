//
//  Main.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 19.03.18.
//

public func startup(app: NSApplication = .shared, delegate: NSObject & NSApplicationDelegate, menu: NSMenu) {
    app.setActivationPolicy(.regular)
    app.mainMenu = menu
    app.delegate = delegate
    app.run()
}

