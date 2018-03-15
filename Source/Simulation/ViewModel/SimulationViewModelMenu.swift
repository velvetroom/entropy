import Foundation

class SimulationViewModelMenu {
    var items:[SimulationViewModelMenuProtocol]
    var selected:IndexPath
    
    var selectedItem:SimulationViewModelMenuProtocol {
        get {
            return self.items[selected.item]
        }
    }
    
    init() {
        self.items = []
        self.selected = IndexPath(item:0, section:0)
    }
    
    func update(project:Project) {
        for item:SimulationViewModelMenuProtocol in self.items {
            item.project = project
        }
    }
}
