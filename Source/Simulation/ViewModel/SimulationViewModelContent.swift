import Foundation

class SimulationViewModelContent:Equatable {
    var items:[SimulationViewModelContentProtocol]
    
    init() {
        self.items = []
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
