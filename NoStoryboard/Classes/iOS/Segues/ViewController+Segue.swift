//
//  ViewController+Segue.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 18.03.18.
//

extension ViewController {
    public func performSegue(identifier: String, to destination: UIViewController, type: Segue.Kind, sender: Any?) {
        let segue = Segue(
            identifier: identifier,
            source: self,
            destination: destination,
            type: type,
            sender: sender
        )
        segue.perform()
    }
    
    public func performSegue(identifier: String, to destination: UIViewController, sender: Any?, _ perform: @escaping (UIViewController, UIViewController, Any?) -> ()) {
        let segue = Segue(
            identifier: identifier,
            source: self,
            destination: destination,
            type: .custom(perform),
            sender: sender
        )
        segue.perform()
    }
}
