//
//  TableView.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 04.04.18.
//

import Foundation
import UIKit

extension UITableView {
    public func register(cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: "\(cellType)")
    }

    public func dequeueReusableCell<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: "\(cellType)", for: indexPath) as? T else {
            fatalError("\(cellType) needs to be registered before use. (Use UITableView.register(cellType:) for that.")
        }
        return cell
    }
}
