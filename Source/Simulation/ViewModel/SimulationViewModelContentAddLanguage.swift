import Foundation

class SimulationViewModelContentAddLanguage:SimulationViewModelContentProtocol {
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellAddLanguage.self
    let cellIdentifier:String = SimulationViewContent.Constants.cellAddLanguage
}
