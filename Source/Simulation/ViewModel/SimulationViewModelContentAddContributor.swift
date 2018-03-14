import Foundation

class SimulationViewModelContentAddContributor:SimulationViewModelContentProtocol {
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellAddContributor.self
    let cellIdentifier:String = SimulationViewContent.Constants.cellAddContributor
}
