import UIKit

internal final class PresentationStrategyInitial:PresentationStrategyProtocol {
    internal static func present<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        presenter:PresenterProtocol,
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>) {
        presenter.addController(model:model)
        presenter.addView(model:model)
        layoutView(presenter:presenter, model:model)
    }
    
    private static func layoutView<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        presenter:PresenterProtocol,
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>) {
        guard
            let topView:UIView = presenter.topView,
            let view:ConcreteController.SpecialisedView = model.view
        else {
            return
        }
        view.presentationLayout = factoryLayout(topView:topView, view:view)
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
