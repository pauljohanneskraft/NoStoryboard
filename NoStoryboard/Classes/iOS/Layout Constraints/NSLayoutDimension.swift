//
//  NSLayoutDimension.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 18.03.18.
//

@available(iOS 9.0, *)
public extension NSLayoutDimension {
    
    @objc
    public func constrain(equalToConstant constant: CGFloat) {
        constraint(equalToConstant: constant).activate()
    }
    
    @objc
    public func constrain(lessThanOrEqualToConstant constant: CGFloat) {
        constraint(lessThanOrEqualToConstant: constant).activate()
    }
    
    @objc
    public func constrain(greaterThanOrEqualToConstant constant: CGFloat) {
        constraint(greaterThanOrEqualToConstant: constant).activate()
    }
    
    @objc
    public func constrain(equalTo dimension: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constraint(equalTo: dimension, multiplier: multiplier, constant: constant).activate()
    }
    
    @objc
    public func constrain(lessThanOrEqualTo dimension: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: constant).activate()
    }
    
    @objc
    public func constrain(greaterThanOrEqualTo dimension: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier, constant: constant).activate()
    }
}
