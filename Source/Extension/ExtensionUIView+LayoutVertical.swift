import UIKit

extension UIView {
    @discardableResult
    func layoutTopToTop(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.top,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.top,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutTopToBottom(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.top,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.bottom,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutBottomToBottom(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.bottom,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.bottom,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutBottomToTop(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.bottom,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.top,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
}
