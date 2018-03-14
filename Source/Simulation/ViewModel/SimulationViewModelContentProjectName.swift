import UIKit

class SimulationViewModelContentProjectName:SimulationViewModelContentProtocol {
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellProjectName.self
    let cellIdentifier:String = SimulationViewContent.Constants.CellIdentifiers.projectName
    let cellHeight:CGFloat = SimulationViewContent.Constants.CellHeight.projectName
}
