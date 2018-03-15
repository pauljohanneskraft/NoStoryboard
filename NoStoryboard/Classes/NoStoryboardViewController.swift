//
//  NoStoryboardViewController.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

class NoStoryBoardViewController: UIViewController {
    init(view: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.view = view
        viewDidLoad()
    }
    
    convenience init() {
        self.init(view: UIView())
    }
    
    convenience init(frame: CGRect) {
        self.init(view: UIView(frame: frame))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
