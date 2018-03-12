import Foundation

struct SimulationViewModelMenu {
    var items:[SimulationViewModelMenuProtocol]
    var selected:IndexPath
    
    init() {
        self.items = []
        self.selected = IndexPath(item:0, section:0)
    }
}
