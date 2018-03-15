import UIKit

class SimulationViewModelContentProjectStartDate:SimulationViewModelContentProtocol,
SimulationViewModelContentProjectProtocol {
    weak var project:Project?
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellProjectName.self
    let cellIdentifier:String = SimulationViewContent.Constants.CellIdentifiers.projectStartDate
    let cellHeight:CGFloat = SimulationViewContent.Constants.CellHeight.projectStartDate
}
