//
//  Router.swift
//
//
//  Created by Logan Blevins on 6/16/24.
//

import SwiftUI

public final class Router<Routes: Routable>: Navigatable, ObservableObject {

    public typealias Destination = Routes

    @Published public var stack: [Routes] = []

    public init() {}
}
