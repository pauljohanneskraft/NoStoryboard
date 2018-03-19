//
//  UIDeviceOrientation.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 15.03.18.
//

extension UIDeviceOrientation {
    public var angle: CGFloat {
        switch self {
        case .landscapeRight:
            return CGFloat.pi * 0.5
        case .landscapeLeft:
            return CGFloat.pi * 1.5
        case .portraitUpsideDown:
            return CGFloat.pi
        case .portrait, .unknown, .faceDown, .faceUp:
            return 0
        }
    }
}
