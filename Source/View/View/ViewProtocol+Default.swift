import Foundation

internal extension ViewProtocol {
    internal init(model:SpecialisedModel) {
        self.init()
        self.model = model
        self.factoryViews()
    }
}
