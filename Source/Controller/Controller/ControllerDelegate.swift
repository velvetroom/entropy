import Foundation

internal protocol ControllerDelegate:AnyObject {
    func controllerDidLoad()
    func controllerDidAppear()
    func controllerWillLoadView<SpecialisedDatasource:ModelDatasource, SpecialisedDelegate:ViewDelegate>(
        datasource:SpecialisedDatasource, delegate:SpecialisedDelegate)
}
