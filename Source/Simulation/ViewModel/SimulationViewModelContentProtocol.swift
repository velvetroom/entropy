import UIKit

protocol SimulationViewModelContentProtocol {
    var cellType:SimulationViewContentCell.Type { get }
    var cellIdentifier:String { get }
}
