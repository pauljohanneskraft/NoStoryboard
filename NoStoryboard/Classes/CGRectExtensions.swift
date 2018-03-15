//
//  CGRectExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

extension CGRect {
    mutating func rotate(into orientation: UIDeviceOrientation, inside frameSize: CGSize) {
        switch orientation {
        case .unknown, .portrait, .faceDown, .faceUp:
            break
        case .landscapeLeft:
            let oldOrigin = origin
            origin.y = frameSize.height - oldOrigin.x - size.height
            origin.x = oldOrigin.y
            swap(&size.height, &size.width)
        case .landscapeRight:
            let oldOrigin = origin
            origin.y = oldOrigin.x
            origin.x = frameSize.width - oldOrigin.y - size.width
            swap(&size.height, &size.width)
        case .portraitUpsideDown:
            origin.x = frameSize.width - origin.x - size.width
            origin.y = frameSize.height - origin.y - size.height
        }
    }
    
    func rotated(into orientation: UIDeviceOrientation, inside frameSize: CGSize) -> CGRect {
        var new = self
        new.rotate(into: orientation, inside: frameSize)
        return new
    }
}

