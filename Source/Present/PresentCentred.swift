import Foundation

internal final class PresentCentred:PresentProtocol {
    internal class func present(model:AbstractModel, controller:ApplicationController) {
        self.addController(model:model, controller:controller)
        self.addView(model:model, controller:controller)
    }
    
//    private static func factoryLayout(model:AbstractModel, controller:ApplicationController) -> PresentationLayout {
//        var layout:PresentationLayout = PresentationLayout()
//        layout.layoutTop = view.layoutTopToTop(view:topView)
//        layout.layoutBottom = view.layoutBottomToBottom(view:topView)
//        layout.layoutRight = view.layoutRightToRight(view:topView)
//        layout.layoutLeft = view.layoutLeftToLeft(view:topView)
//        return layout
//    }
}
