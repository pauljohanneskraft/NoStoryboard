//
//  SyntacticSugar.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

import Foundation

public protocol AnyThing {}

public extension AnyThing {
    public func `where`(_ fun: (inout Self) -> ()) -> Self {
        var this = self
        fun(&this)
        return this
    }
}

extension CGSize: AnyThing {}
extension String: AnyThing {}
extension UIView: AnyThing {}

