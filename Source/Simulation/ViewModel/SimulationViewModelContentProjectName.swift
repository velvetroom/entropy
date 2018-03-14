import Foundation

class SimulationViewModelContentProjectName:SimulationViewModelContentProtocol {
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellProjectName.self
    let cellIdentifier:String = SimulationViewContent.Constants.cellProjectName
}
