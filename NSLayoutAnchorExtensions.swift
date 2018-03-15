//
//  NSLayoutAnchorExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

@available(iOS 9.0, *)
public extension NSLayoutAnchor {
    @objc
    public func constrain(equalTo: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    @objc
    public func constrain(lessThanOrEqualTo: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(lessThanOrEqualTo: lessThanOrEqualTo, constant: constant).isActive = true
    }
    
    @objc
    public func constrain(greaterThanOrEqualTo: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(greaterThanOrEqualTo: greaterThanOrEqualTo, constant: constant).isActive = true
    }
}

@available(iOS 9.0, *)
public extension NSLayoutDimension {
    @objc
    public func constrain(equalToConstant: CGFloat) {
        constraint(equalToConstant: equalToConstant).isActive = true
    }
}
