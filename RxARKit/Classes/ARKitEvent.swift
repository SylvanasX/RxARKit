//
//  ARKitEvent.swift
//  Pods-RxARKit_Example
//
//  Created by ptyuan on 2018/6/17.
//

import ARKit

public typealias RendererEvent = (renderer: SCNSceneRenderer, node: SCNNode, anchor: ARAnchor)
public typealias RendererTimeEvent = (renderer: SCNSceneRenderer, time: TimeInterval)
public typealias RendererSceneTimeEvent = (renderer: SCNSceneRenderer, scene: SCNScene, time: TimeInterval)
