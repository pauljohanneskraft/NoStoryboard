//
//  NSLayoutAnchorExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

@available(iOS 9.0, *)
extension NSLayoutAnchor {
    @objc
    func constrain(equalTo: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    @objc
    func constrain(lessThanOrEqualTo: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(lessThanOrEqualTo: lessThanOrEqualTo, constant: constant).isActive = true
    }
    
    @objc
    func constrain(greaterThanOrEqualTo: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0) {
        constraint(greaterThanOrEqualTo: greaterThanOrEqualTo, constant: constant).isActive = true
    }
}

@available(iOS 9.0, *)
extension NSLayoutDimension {
    @objc
    func constrain(equalToConstant: CGFloat) {
        constraint(equalToConstant: equalToConstant).isActive = true
    }
}
