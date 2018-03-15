//
//  AsyncDictionary.swift
//  siemensctitp
//
//  Created by Paul Kraft on 23.05.17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

import Foundation

struct AsyncDictionary<Key: Hashable, Value> : ExpressibleByDictionaryLiteral, Sequence {
    
    // MARK: Stored properties
    fileprivate var dict : [Key: Value]
    private var queue: DispatchQueue
    
    // MARK: Computed properties
    var values: Dictionary<Key, Value>.Values {
        return queue.sync { dict.values }
    }
    
    var keys: Dictionary<Key, Value>.Keys {
        return queue.sync { dict.keys }
    }
    
    // MARK: Initializers
    init() {
        self.dict = [:]
        self.queue = DispatchQueue(label: "\(AsyncDictionary<Key, Value>.self)")
    }
    
    init(dictionaryLiteral elements: (Key, Value)...) {
        self.init()
        queue.sync {
            for (key, value) in elements {
                self.dict[key] = value
            }
        }
    }
    
    func makeIterator() -> DictionaryIterator<Key, Value> {
        return queue.sync { dict.makeIterator() }
    }
    
    // MARK: Subscripts
    subscript(key: Key) -> Value? {
        get {
            return queue.sync {
                dict[key]
            }
        }
        set {
            queue.sync(flags: .barrier) {
                dict[key] = newValue
            }
        }
    }
    
    mutating func access<T>(_ fun: @escaping (inout [Key: Value]) -> T) -> T {
        return queue.sync(flags: .barrier) { fun(&self.dict) }
    }
}

// MARK: Extension - CustomStringConvertible
extension AsyncDictionary: CustomStringConvertible {
    var description: String {
        return dict.description
    }
}
