import Foundation

extension SimulationViewModel {
    class func factoryMenu() -> SimulationViewModelMenu {
        let items:[SimulationViewModelMenuProtocol] = [
            SimulationViewModelMenuProject(),
            SimulationViewModelMenuContributors()]
        var menu:SimulationViewModelMenu = SimulationViewModelMenu()
        menu.items = items
        return menu
    }
}
