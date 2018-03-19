//
//  NSLayoutAnchor.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 18.03.18.
//

@available(iOS 9.0, *)
public extension NSLayoutAnchor {
    @objc
    public func constrain(equalTo anchor: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(equalTo: anchor, constant: constant).activate()
    }
    
    @objc
    public func constrain(lessThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(lessThanOrEqualTo: anchor, constant: constant).activate()
    }
    
    @objc
    public func constrain(greaterThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(greaterThanOrEqualTo: anchor, constant: constant).activate()
    }
}
