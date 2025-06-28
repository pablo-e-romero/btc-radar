//
//  Router.swift
//  MEFramework
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI
import Observation

public protocol Routable: View, Hashable { }

@Observable
public final class Router<Route: Routable> {
    public var routes: [Route] = []

    public func push(_ route: Route) {
        routes.append(route)
    }

    public func pop() {
        routes.removeLast()
    }

    public func popToRoot() {
        routes.removeAll()
    }
}

public struct RouterView<Route: Routable>: View {
    private let route: Route
    @State private var router = Router<Route>()

    public init(route: Route) {
        self.route = route
    }

    public var body: some View {
        NavigationStack(path: $router.routes) {
            route
                .navigationDestination(for: Route.self) { $0 }
        }
        .environment(router)
    }
}
