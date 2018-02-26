import Foundation

internal extension Model {
    internal func controllerDidLoad() { }
    internal func controllerDidAppear() { }
    internal func controllerWillLoadView<SpecialisedDatasource, SpecialisedDelegate>(datasource: SpecialisedDatasource, delegate: SpecialisedDelegate) where SpecialisedDatasource : ModelDatasource, SpecialisedDelegate : ViewDelegate {
        
    }
}
