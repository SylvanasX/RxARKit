//
//  RxARSCNViewDelegateProxy.swift
//  Pods-RxARKit_Example
//
//  Created by ptyuan on 2018/6/16.
//

import ARKit
import RxSwift
import RxCocoa

extension ARSCNView: HasDelegate {
    public typealias Delegate = ARSCNViewDelegate
}

public class RxARSCNViewDelegateProxy
    : DelegateProxy<ARSCNView, ARSCNViewDelegate>
    , DelegateProxyType
    , ARSCNViewDelegate {
    public init(view: ARSCNView) {
        super.init(parentObject: view, delegateProxy: RxARSCNViewDelegateProxy.self)
    }
    
    public static func registerKnownImplementations() {
        self.register { RxARSCNViewDelegateProxy(view: $0) }
    }
}
