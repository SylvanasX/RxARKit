//
//  RxHelpers.swift
//  Pods-RxARKit_Example
//
//  Created by ptyuan on 2018/6/17.
//

import ARKit
import RxSwift
import RxCocoa

func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    return returnValue
}

func arRendererEvent(_ args: [Any]) throws -> RendererEvent {
    return (try castOrThrow(SCNSceneRenderer.self, args[0]), try castOrThrow(SCNNode.self, args[1]), try castOrThrow(ARAnchor.self, args[2]))
}

func arRendererTimeEvent(_ args: [Any]) throws -> RendererTimeEvent {
    let renderer = try castOrThrow(SCNSceneRenderer.self, args[0])
    let time = try castOrThrow(TimeInterval.self, args[1])
    return (renderer, time)
}

func arRendererSceneTimeEvent(_ args: [Any]) throws -> RendererSceneTimeEvent {
    let renderer = try castOrThrow(SCNSceneRenderer.self, args[0])
    let scene = try castOrThrow(SCNScene.self, args[1])
    let time = try castOrThrow(TimeInterval.self, args[2])
    return (renderer, scene, time)
}

