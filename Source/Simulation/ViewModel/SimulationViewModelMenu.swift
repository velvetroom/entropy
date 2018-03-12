import Foundation

struct SimulationViewModelMenu {
    var items:[SimulationViewModelMenuProtocol]
    var selected:Int
    
    init() {
        self.items = []
        self.selected = 0
    }
}
