//
//  NavigationPath.swift
//
//
//  Created by Logan Blevins on 6/16/24.
//

import SwiftUI

public typealias Routable = View & Hashable

public protocol Navigatable<Destination>: AnyObject {
    associatedtype Destination: Routable

    var stack: [Destination] { get set }

    func push(_ destination: Destination)
    func push(_ destinations: [Destination])
    func pop()
    func popToRoot()
    func replace(_ destinations: [Destination])
}

extension Navigatable {
    public func push(_ destination: Destination) {
        stack.append(destination)
    }

    public func push(_ destinations: [Destination]) {
        stack += destinations
    }

    public func pop() {
        if stack.isEmpty == false {
            stack.removeLast()
        }
    }

    public func popToRoot() {
        stack = []
    }

    public func replace(_ destinations: [Destination]) {
        stack = destinations
    }
}
