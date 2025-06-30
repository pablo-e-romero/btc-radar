//
//  HashableObject.swift
//  MEFramework
//
//  Created by Pablo Romero on 30/6/25.
//

public protocol HashableObject: AnyObject, Hashable {}

extension HashableObject {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
