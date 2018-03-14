import UIKit

class SimulationViewModelContentAddLanguage:SimulationViewModelContentProtocol {
    let cellType:SimulationViewContentCell.Type = SimulationViewContentCellAddLanguage.self
    let cellIdentifier:String = SimulationViewContent.Constants.CellIdentifiers.addLanguage
    let cellHeight:CGFloat = SimulationViewContent.Constants.CellHeight.addLanguage
}
