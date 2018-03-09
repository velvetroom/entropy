import UIKit

extension UIView {
    @discardableResult
    func layoutLeftToLeft(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.left,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.left,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutLeftToRight(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.left,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.right,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutRightToRight(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.right,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.right,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func layoutRightToLeft(view:UIView, constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.right,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.left,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        return constraint
    }
}
