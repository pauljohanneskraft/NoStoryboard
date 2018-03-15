//
//  UIDeviceExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

extension UIDevice {
    public var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}
