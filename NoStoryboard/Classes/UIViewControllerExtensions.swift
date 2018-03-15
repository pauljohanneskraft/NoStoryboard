//
//  UIViewControllerExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

extension UIViewController {
    public func performSegue(identifier: String, to destination: UIViewController, type: CodeSegue.SegueType, sender: Any?) {
        let segue = CodeSegue(
            identifier: identifier,
            source: self,
            destination: destination,
            type: type,
            sender: sender
        )
        segue.perform()
    }
}
