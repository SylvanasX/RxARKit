//
//  ARSCNView+Rx.swift
//  Pods-RxARKit_Example
//
//  Created by ptyuan on 2018/6/17.
//

import ARKit
import RxSwift
import RxCocoa

extension Reactive where Base: ARSCNView {
    public var delegate: RxARSCNViewDelegateProxy {
        return RxARSCNViewDelegateProxy.proxy(for: base)
    }
    
    public func setDelegate(_ delegate: ARSCNViewDelegate) -> Disposable {
        return RxARSCNViewDelegateProxy.installForwardDelegate(
            delegate,
            retainDelegate: false,
            onProxyForObject: self.base
        )
    }
    
    public var rendererDidAddNodeForAnchor: ControlEvent<RendererEvent> {
        let source: Observable<RendererEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:didAdd:for:)))
            .map(arRendererEvent)
        return ControlEvent(events: source)
    }

    public var rendererWillUpdateNodeForAnchor: ControlEvent<RendererEvent> {
        let source: Observable<RendererEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:willUpdate:for:)))
            .map(arRendererEvent)
        return ControlEvent(events: source)
    }

    public var rendererDidUpdateNodeForAnchor: ControlEvent<RendererEvent> {
        let source: Observable<RendererEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:didUpdate:for:)))
            .map(arRendererEvent)
        return ControlEvent(events: source)
    }
    
    public var rendererDidMoveNodeForAnchor: ControlEvent<RendererEvent> {
        let source: Observable<RendererEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:didRemove:for:)))
            .map(arRendererEvent)
        return ControlEvent(events: source)
    }
    
    public var didFailWithError: ControlEvent<Error> {
        let source: Observable<Error> = delegate.methodInvoked(#selector(ARSessionObserver.session(_:didFailWithError:)))
            .map { a in
                return (try castOrThrow(Error.self, a[1]))
            }
        return ControlEvent(events: source)
    }
    
    public var cameraDidChangeTrackingState: ControlEvent<ARCamera> {
        let source: Observable<ARCamera> = delegate.methodInvoked(#selector(ARSessionObserver.session(_:cameraDidChangeTrackingState:)))
            .map { a in
                return (try castOrThrow(ARCamera.self, a[1]))
        }
        return ControlEvent(events: source)
    }
    
    public var sessionWasInterrupted: ControlEvent<Void> {
        let source: Observable<Void> = delegate.methodInvoked(#selector(ARSessionObserver.session(_:cameraDidChangeTrackingState:)))
            .map { _ in }
        return ControlEvent(events: source)
    }
    
    public var sessionInterruptionEnded: ControlEvent<Void> {
        let source: Observable<Void> = delegate.methodInvoked(#selector(ARSessionObserver.sessionInterruptionEnded(_:)))
            .map { _ in }
        return ControlEvent(events: source)
    }
    
    public var rendererUpdateAtTime: ControlEvent<RendererTimeEvent> {
        let source: Observable<RendererTimeEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:updateAtTime:)))
            .map(arRendererTimeEvent)
        return ControlEvent(events: source)
    }
    
    public var rendererDidApplyAnimationsAtTime: ControlEvent<RendererTimeEvent> {
        let source: Observable<RendererTimeEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:didApplyConstraintsAtTime:)))
            .map(arRendererTimeEvent)
        return ControlEvent(events: source)
    }
    
    public var rendererDidSimulatePhysicsAtTime: ControlEvent<RendererTimeEvent> {
        let source: Observable<RendererTimeEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:didSimulatePhysicsAtTime:)))
            .map(arRendererTimeEvent)
        return ControlEvent(events: source)
    }
    
    public var rendererDidApplyConstraintsAtTime: ControlEvent<RendererTimeEvent> {
        let source: Observable<RendererTimeEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:didApplyConstraintsAtTime:)))
            .map(arRendererTimeEvent)
        return ControlEvent(events: source)
    }
    
    public var rendererWillRenderSceneAtTime: ControlEvent<RendererSceneTimeEvent> {
        let source: Observable<RendererSceneTimeEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:willRenderScene:atTime:)))
            .map(arRendererSceneTimeEvent)
        return ControlEvent(events: source)
    }
    
    public var rendererDidRenderSceneAtTime: ControlEvent<RendererSceneTimeEvent> {
        let source: Observable<RendererSceneTimeEvent> = delegate.methodInvoked(#selector(ARSCNViewDelegate.renderer(_:didRenderScene:atTime:)))
            .map(arRendererSceneTimeEvent)
        return ControlEvent(events: source)
    }
    
    public var didOutputAudioSampleBuffer: ControlEvent<CMSampleBuffer> {
        let source: Observable<CMSampleBuffer> = delegate.methodInvoked(#selector(ARSCNViewDelegate.session(_:didOutputAudioSampleBuffer:)))
            .map { a in
                return try castOrThrow(CMSampleBuffer.self, a[1])
            }
        return ControlEvent(events: source)
    }
}















