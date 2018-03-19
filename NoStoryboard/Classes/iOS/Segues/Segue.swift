//
//  Segue.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 15.03.18.
//

public class Segue: UIStoryboardSegue {
    public let type: Kind
    public let sender: Any?
    
    public init(identifier: String, source: UIViewController, destination: UIViewController, type: Kind, sender: Any?) {
        self.type = type
        self.sender = sender
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override open func perform() {
        guard source.shouldPerformSegue(withIdentifier: identifier ?? "", sender: sender) else {
            return
        }
        source.prepare(for: self, sender: sender)
        type.perform(source: source, destination: destination, sender: sender)
    }
}

extension Segue {
    public enum Kind {
        case push, replace, modally, popover
        case custom((_ source: UIViewController, _ destionation: UIViewController, _ sender: Any?) -> ())
        
        public func perform(source: UIViewController, destination: UIViewController, sender: Any?) {
            switch self {
            case .push:
                let target = source.targetViewController(forAction: #selector(UIViewController.show(_:sender:)),
                                                         sender: self)
                (target ?? source).show(destination, sender: sender)
            case .replace:
                let target = source.targetViewController(forAction: #selector(UIViewController.showDetailViewController(_:sender:)),
                                                         sender: self)
                (target ?? source).showDetailViewController(destination, sender: sender)
            case .popover:
                destination.modalPresentationStyle = .popover
                fallthrough
            case .modally:
                source.present(destination, animated: true, completion: nil)
            case .custom(let customPerform):
                customPerform(source, destination, sender)
            }
        }
    }
}
