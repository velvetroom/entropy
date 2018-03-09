import UIKit

extension UIView {
    func layoutEquals(view:UIView, margin:CGFloat = 0) {
        self.layoutEqualsVertical(view:view, margin:margin)
        self.layoutEqualsHorizontal(view:view, margin:margin)
    }
    
    func layoutEqualsHorizontal(view:UIView, margin:CGFloat = 0) {
        self.layoutLeftToLeft(view:view, constant:margin)
        self.layoutRightToRight(view:view, constant:-margin)
    }
    
    func layoutEqualsVertical(view:UIView, margin:CGFloat = 0) {
        self.layoutTopToTop(view:view, constant:margin)
        self.layoutBottomToBottom(view:view, constant:-margin)
    }
}
