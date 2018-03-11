import Foundation

extension SimulationViewModel {
    class func factoryMenu() -> [SimulationViewModelMenuProtocol] {
        let items:[SimulationViewModelMenuProtocol] = [
            SimulationViewModelMenuProject(),
            SimulationViewModelMenuContributors()]
        return items
    }
}
