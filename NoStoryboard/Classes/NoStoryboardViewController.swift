//
//  NoStoryboardViewController.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

open class NoStoryBoardViewController: UIViewController {
    public init(view: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.view = view
        viewDidLoad()
    }
    
    public convenience init() {
        self.init(view: UIView())
    }
    
    public convenience init(frame: CGRect) {
        self.init(view: UIView(frame: frame))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
