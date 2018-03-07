import Foundation

internal final class PresentCentred:PresentProtocol {
    internal class func present(model:Model, controller:ApplicationController) {
        addController(model:model, controller:controller)
        addView(model:model, controller:controller)
        layout(model:model, controller:controller)
    }
    
    private class func layout(model:Model, controller:ApplicationController) {
        var layout:PresentLayout = PresentLayout()
        layout.layoutTop = model.controller.view.layoutTopToTop(view:controller.view)
        layout.layoutBottom = model.controller.view.layoutBottomToBottom(view:controller.view)
        layout.layoutRight = model.controller.view.layoutRightToRight(view:controller.view)
        layout.layoutLeft = model.controller.view.layoutLeftToLeft(view:controller.view)
        model.controller.savePresentLayout(layout:layout)
    }
}
