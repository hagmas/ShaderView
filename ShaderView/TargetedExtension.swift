//
//  TargetedExtension.swift
//  ShaderView
//
//  Created by Haga Masaki on 25/10/2017.
//  Copyright © 2017 Haga Masaki. All rights reserved.
//

import Foundation

public struct SVExtension<Base> {
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has ShaderView extensions.
public protocol SVExtensionCompatible {
    associatedtype CompatibleType
    
    static var sv: SVExtension<CompatibleType>.Type { get set }
    
    var sv: SVExtension<CompatibleType> { get set }
}

extension SVExtensionCompatible {
    public static var sv: SVExtension<Self>.Type {
        get {
            return SVExtension<Self>.self
        }
        set {
            // this enables using ShaderViewExtension to "mutate" base type
        }
    }
    
    /// ShaderView extensions.
    public var sv: SVExtension<Self> {
        get {
            return SVExtension(self)
        }
        set {
            // this enables using ShaderViewExtension to "mutate" base object
        }
    }
}

import class Foundation.NSObject

/// Extend NSObject with `mfs` proxy.
extension NSObject: SVExtensionCompatible { }
