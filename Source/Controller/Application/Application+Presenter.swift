import Foundation

internal extension Application {
    internal class func factoryPresenter() -> Presenter {
        let presenter:Presenter = Presenter()
        return presenter
    }
    
    internal class func factoryInitialPresentation() -> PresentationProtocol {
        let model:ModelSimulation = Application.factoryModelSimulation()
        let presentation:PresentationInitial = PresentationInitial(model:model)
        return presentation
    }
    
    private class func factoryModelSimulation() -> ModelSimulation {
        let model:ModelSimulation = ModelSimulation()
        return model
    }
}
