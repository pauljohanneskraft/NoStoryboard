//
//  InsetLabel.swift
//  FBSnapshotTestCase
//
//  Created by Paul Kraft on 15.03.18.
//

class InsetLabel: UILabel {
    var textInsets = UIEdgeInsets.zero
}

extension InsetLabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
    }
    
    override var intrinsicContentSize: CGSize {
        return super.intrinsicContentSize.where {
            $0.width += textInsets.left + textInsets.right
            $0.height += textInsets.top + textInsets.bottom
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return super.sizeThatFits(size).where {
            $0.width += textInsets.left + textInsets.right
            $0.height += textInsets.top + textInsets.bottom
        }
    }
}
