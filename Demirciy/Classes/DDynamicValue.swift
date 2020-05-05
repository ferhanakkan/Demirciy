//
//  DDynamicValue.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 4.05.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

open class DDynamicValue<T> {
    
    // MARK: - Properties
    public typealias CompletionHandler = ((T) -> Void)
    public var value: T {
        didSet {
            self.notify()
        }
    }
    private var observers = [String: CompletionHandler]()
    
    public init(_ value: T) {
        self.value = value
    }
    
    deinit {
        observers.removeAll()
    }
}

// MARK: - Public Functions
public extension DDynamicValue {
    
    func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        addObserver(observer, completionHandler: completionHandler)
        notify()
    }
}

// MARK: - Private Functions
private extension DDynamicValue {
    
    func notify() {
        observers.forEach({ $0.value(value) })
    }
}
