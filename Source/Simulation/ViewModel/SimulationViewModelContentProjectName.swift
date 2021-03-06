import UIKit

class SimulationViewModelContentProjectName:SimulationViewModelContentProtocol,
    SimulationViewModelContentProjectProtocol {
    weak var project:Project?
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellProjectName.self
    let cellIdentifier:String = SimulationViewContent.Constants.CellIdentifiers.projectName
    let cellHeight:CGFloat = SimulationViewContent.Constants.CellHeight.projectName
}
