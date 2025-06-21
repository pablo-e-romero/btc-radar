//
//  Router.swift
//  MEFramework
//
//  Created by Pablo Romero on 21/6/25.
//

import SwiftUI
import Observation

public typealias Routable = Hashable & View

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

public struct RouterView<RootView: View, Route: Routable>: View {
    @State
    private var router = Router<Route>()
    private let rootView: RootView

    public init(rootView: () -> RootView) {
        self.rootView = rootView()
    }

    public var body: some View {
        NavigationStack(path: $router.routes) {
            rootView
                .navigationDestination(for: Route.self) { $0 }
        }
        .environment(router)
    }
}
