//
//  UIViewExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

@available(iOS 9.0, *)
extension UIView {
    public func addSubviewWithConstraints(fillingCompletely subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subView)
        subView.addConstraints(fillingSuperViewCompletely: self)
    }
    
    public func addConstraints(fillingSuperViewCompletely superView: UIView) {
        if #available(iOS 11.0, *) {
            let margins = superView.safeAreaLayoutGuide
            topAnchor     .constrain(equalTo: margins  .topAnchor     )
            bottomAnchor  .constrain(equalTo: margins  .bottomAnchor  )
            leadingAnchor .constrain(equalTo: margins  .leadingAnchor )
            trailingAnchor.constrain(equalTo: margins  .trailingAnchor)
        } else {
            topAnchor     .constrain(equalTo: superView.topAnchor     )
            bottomAnchor  .constrain(equalTo: superView.bottomAnchor  )
            leadingAnchor .constrain(equalTo: superView.leadingAnchor )
            trailingAnchor.constrain(equalTo: superView.trailingAnchor)
        }
    }
}

@available(iOS 10.0, *)
extension UIView {
    
    @discardableResult
    public func blur(style: UIBlurEffectStyle = .regular, alpha: CGFloat = 0.35) -> UIVisualEffectView {
        let effect = UIBlurEffect(style: style)
        return UIVisualEffectView(effect: effect).where { blurView in
            blurView.alpha = alpha
            blurView.frame = frame
            addSubviewWithConstraints(fillingCompletely: blurView)
            sendSubview(toBack: blurView)
        }
    }
}
