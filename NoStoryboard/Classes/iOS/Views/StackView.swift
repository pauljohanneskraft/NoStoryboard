//
//  UIStackView.swift
//  NoStoryboard
//
//  Created by Paul Kraft on 18.03.18.
//

@available(iOS 9.0, *)
extension UIStackView {
    
    convenience init(alignment: UIStackViewAlignment, axis: UILayoutConstraintAxis, distribution: UIStackViewDistribution, subviews: [UIView]) {
        self.init()
        self.alignment = alignment
        self.axis = axis
        self.distribution = distribution
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview($0)
        }
    }
}
