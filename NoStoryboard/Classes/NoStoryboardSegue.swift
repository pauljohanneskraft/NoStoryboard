//
//  NoStoryboardSegue.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

public extension CodeSegue {
    public enum SegueType {
        case show, replace
        
        public func perform(source: UIViewController, destination: UIViewController, sender: Any?) {
            switch self {
            case .show:
                let target = source.targetViewController(forAction: #selector(UIViewController.show(_:sender:)),
                                                         sender: self)
                target?.show(destination, sender: sender)
            case .replace:
                let target = source.targetViewController(forAction: #selector(UIViewController.show(_:sender:)),
                                                         sender: self)
                target?.showDetailViewController(destination, sender: sender)
            }
        }
    }
}

open class CodeSegue: UIStoryboardSegue {
    public let type: SegueType
    public let sender: Any?
    
    public init(identifier: String, source: UIViewController, destination: UIViewController, type: SegueType, sender: Any?) {
        self.type = type
        self.sender = sender
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override open func perform() {
        source.prepare(for: self, sender: sender)
        type.perform(source: source, destination: destination, sender: sender)
    }
}

