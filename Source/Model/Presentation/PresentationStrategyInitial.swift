import UIKit

internal final class PresentationStrategyInitial:PresentationStrategyProtocol {
    internal static func present<ConcreteController>(presenter:PresenterProtocol, model:Model<ConcreteController>) {
        presenter.addController(model:model)
        presenter.addView(model:model)
        PresentationStrategyInitial.layoutView(presenter:presenter, model:model)
    }
    
    private static func layoutView<ConcreteController>(presenter:PresenterProtocol,
                                                       model:Model<ConcreteController>) {
        guard
            let topView:UIView = presenter.topView,
            let view:ConcreteController.SpecialisedView = model.view
        else {
            return
        }
        view.presentationLayout = PresentationStrategyInitial.factoryLayout(topView:topView, view:view)
    }
    
    private static func factoryLayout<SpecialisedView:View>(topView:UIView,
                                                            view:SpecialisedView) -> PresentationLayout {
        var layout:PresentationLayout = PresentationLayout()
        layout.layoutTop = view.layoutTopToTop(view:topView)
        layout.layoutBottom = view.layoutBottomToBottom(view:topView)
        layout.layoutRight = view.layoutRightToRight(view:topView)
        layout.layoutLeft = view.layoutLeftToLeft(view:topView)
        return layout
    }
}
