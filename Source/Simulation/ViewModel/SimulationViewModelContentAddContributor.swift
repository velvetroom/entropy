import UIKit

class SimulationViewModelContentAddContributor:SimulationViewModelContentProtocol {
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellAddContributor.self
    let cellIdentifier:String = SimulationViewContent.Constants.CellIdentifiers.addContributor
    let cellHeight:CGFloat = SimulationViewContent.Constants.CellHeight.addContributor
}
