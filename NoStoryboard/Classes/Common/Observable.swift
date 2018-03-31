//
//  Observable.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 19.03.18.
//

protocol Observable: AnyObject {
    static var dispatchQueue: DispatchQueue { get }
    var observers: [Observer] { get set }
}

extension Observable {
    func subscribe(as observer: Observer) {
        Self.dispatchQueue.sync(flags: .barrier) {
            self.observers.append(observer)
        }
    }
    
    func notifyChange() {
        Self.dispatchQueue.async {
            self.observers.forEach { observer in
                observer.update(observed: self)
            }
        }
    }
}
