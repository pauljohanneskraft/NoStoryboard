//
//  Observer.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 19.03.18.
//

protocol Observer: AnyObject {
    func update(observed: Observable)
}
