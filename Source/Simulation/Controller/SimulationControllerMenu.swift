import Foundation

class SimulationControllerMenu:NSObject {
    var viewModel:[SimulationViewModelMenuProtocol]
    
    override init() {
        self.viewModel = []
        super.init()
    }
}
