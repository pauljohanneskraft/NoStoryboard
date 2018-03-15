//
//  URLExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

extension URL {
    init?(safe: String) {
        guard let string = safe.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        self.init(string: string)
    }
}
