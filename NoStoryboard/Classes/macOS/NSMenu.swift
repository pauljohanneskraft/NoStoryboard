//
//  NSMenu.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 19.03.18.
//

extension NSMenu {
    public convenience init(title: String = "", with items: [NSMenu.Item]) {
        self.init(title: title)
        addItems(items)
    }
    
    public func addItems(_ items: [NSMenu.Item]) {
        items.forEach { self.addItem($0.menuItem) }
    }
    
    public static func defaultAppMenu(title: String) -> NSMenu {
        return NSMenu(title: title, with: [
            .about(appTitle: title, selector: nil),
            .separator,
            .hide(appTitle: title),
            .hideOthers,
            .showAll,
            .separator,
            .quit(appTitle: title)
        ])
    }
    
    public enum Item {
        case separator
        case new(title: String, action: Selector?, keyEquivalent: String)
        case item(NSMenuItem)
        case quit(appTitle: String)
        case hide(appTitle: String)
        case hideOthers
        case showAll
        case preferences(selector: Selector)
        case about(appTitle: String, selector: Selector?)
        
        var menuItem: NSMenuItem {
            switch self {
            case .separator:
                return NSMenuItem.separator()
            case let .new(title, action, keyEquivalent):
                return NSMenuItem(title: title, action: action, keyEquivalent: keyEquivalent)
            case let .item(item):
                return item
            case let .quit(name):
                return NSMenuItem(title: "Quit \(name)", action: #selector(NSApp.terminate(_:)), keyEquivalent: "q")
            case let .hide(name):
                return NSMenuItem(title: "Hide \(name)", action: #selector(NSApp.hide(_:)), keyEquivalent: "h")
            case .hideOthers:
                let item = NSMenuItem(title: "Hide Others",
                                  action: #selector(NSApp.hideOtherApplications(_:)), keyEquivalent: "h")
                item.keyEquivalentModifierMask = [.command, .option]
                return item
            case .showAll:
                return NSMenuItem(title: "Show All", action: #selector(NSApp.unhideAllApplications(_:)), keyEquivalent: "")
            case let .preferences(selector):
                return NSMenuItem(title: "Preferences...", action: selector, keyEquivalent: ",")
            case let .about(name, selector):
                return NSMenuItem(title: "About \(name)", action: selector, keyEquivalent: "")
            }
        }
    }
}
