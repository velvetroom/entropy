import Foundation

class SimulationViewModelContent:Equatable {
    weak var project:Project?
    var items:[SimulationViewModelContentProtocol]
    
    init() {
        self.items = []
    }
    
    func update(project:Project) {
        self.project = project
        self.updateItems(project:project)
    }
    
    private func updateItems(project:Project) {
        for item:SimulationViewModelContentProtocol in self.items {
            guard
                let itemWithProject:SimulationViewModelContentProjectProtocol = item as?
            SimulationViewModelContentProjectProtocol
            else {
                continue
            }
            itemWithProject.project = project
        }
    }
    
    static func ==(lhs:SimulationViewModelContent, rhs:SimulationViewModelContent) -> Bool {
        let lhsCount:Int = lhs.items.count
        let rhsCount:Int = rhs.items.count
        guard
            lhsCount == rhsCount
        else {
            return false
        }
        for index:Int in 0 ..< lhsCount {
            let leftItem:SimulationViewModelContentProtocol = lhs.items[index]
            let rightItem:SimulationViewModelContentProtocol = rhs.items[index]
            let leftItemType:SimulationViewModelContentProtocol.Type = type(of:leftItem)
            let rightItemType:SimulationViewModelContentProtocol.Type = type(of:rightItem)
            guard
                leftItemType == rightItemType
            else {
                return false
            }
        }
        return true
    }
}
