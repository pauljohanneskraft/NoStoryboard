//
//  UIControl.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 19.03.18.
//

extension UIControl {
    fileprivate static var targets = [String: [UIControlTarget]]()
    
    public var targets: [UIControlTarget] {
        get {
            return UIControl.targets[pointerAddress] ?? []
        }
        set {
            UIControl.targets[pointerAddress] = newValue
        }
    }
}

extension UIControl: Control {}

extension CVarArg {
    fileprivate var pointerAddress: String {
        return String(format: "%p", self)
    }
}

public protocol Control: AnyObject, CVarArg {
    var targets: [UIControlTarget] { get set }
    func addTarget(_: Any?, action: Selector, for: UIControlEvents)
    func removeTarget(_: Any?, action: Selector?, for: UIControlEvents)
}

extension Control {
    public func addTarget(for type: UIControlEvents, handler: @escaping (Self, UIEvent) -> ()) {
        let target = UIControlTarget(events: type) { a,b in handler(a as! Self, b) }
        addTarget(target, action: #selector(target.event), for: type)
        targets.append(target)
    }
    
    public func targets(forEvery type: UIControlEvents) -> [UIControlTarget] {
        return targets.filter { ($0.events.rawValue & type.rawValue) == type.rawValue }
    }
    
    public func targets(forAny type: UIControlEvents) -> [UIControlTarget] {
        return targets.filter { ($0.events.rawValue & type.rawValue) != 0 }
    }
    
    public func remove(target: UIControlTarget, for type: UIControlEvents) {
        removeTarget(target, action: #selector(target.event), for: type)
        
        guard let first = targets.enumerated()
            .first(where: { t in t.element === target }) else {
                return
        }
        
        let raw = first.element.events.rawValue & type.rawValue
        if raw == 0 { targets.remove(at: first.offset) }
        first.element.events = UIControlEvents(rawValue: raw)
    }
    
    public func removeAllTargets() {
        for target in targets {
            removeTarget(target, action: #selector(target.event), for: target.events)
        }
        UIControl.targets.removeValue(forKey: pointerAddress)
    }
}

public final class UIControlTarget: NSObject {
    public let handler: (UIControl, UIEvent) -> ()
    public fileprivate(set) var events: UIControlEvents
    
    fileprivate init(events: UIControlEvents, handler: @escaping (UIControl, UIEvent) -> ()) {
        self.events = events
        self.handler = handler
    }
    
    @objc
    fileprivate func event(_ control: UIControl, event: UIEvent) {
        handler(control, event)
    }
}
