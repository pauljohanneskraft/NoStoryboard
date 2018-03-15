//
//  SyntacticSugar.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

import Foundation

protocol AnyThing {}

extension AnyThing {
    func `where`(_ fun: (inout Self) -> ()) -> Self {
        var this = self
        fun(&this)
        return this
    }
}

extension CGSize: AnyThing {}
extension String: AnyThing {}
extension UIView: AnyThing {}

