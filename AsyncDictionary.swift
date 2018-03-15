//
//  AsyncDictionary.swift
//  siemensctitp
//
//  Created by Paul Kraft on 23.05.17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

public struct AsyncDictionary<Key: Hashable, Value> : ExpressibleByDictionaryLiteral, Sequence {
    
    // MARK: Stored properties
    private var dict : [Key: Value]
    private let queue: DispatchQueue
    
    // MARK: Computed properties
    var values: Dictionary<Key, Value>.Values {
        return queue.sync { dict.values }
    }
    
    var keys: Dictionary<Key, Value>.Keys {
        return queue.sync { dict.keys }
    }
    
    // MARK: Initializers
    public init() {
        self.dict = [:]
        self.queue = DispatchQueue(label: "\(AsyncDictionary<Key, Value>.self)")
    }
    
    public init(dictionaryLiteral elements: (Key, Value)...) {
        self.init()
        queue.sync {
            for (key, value) in elements {
                self.dict[key] = value
            }
        }
    }
    
    public func makeIterator() -> DictionaryIterator<Key, Value> {
        return queue.sync { dict.makeIterator() }
    }
    
    // MARK: Subscripts
    public subscript(key: Key) -> Value? {
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
    
    public mutating func access<T>(_ fun: @escaping (inout [Key: Value]) -> T) -> T {
        return queue.sync(flags: .barrier) { fun(&self.dict) }
    }
}

// MARK: Extension - CustomStringConvertible
extension AsyncDictionary: CustomStringConvertible {
    public var description: String {
        return dict.description
    }
}
