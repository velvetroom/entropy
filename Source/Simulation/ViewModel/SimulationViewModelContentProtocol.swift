import UIKit

protocol SimulationViewModelContentProtocol:AnyObject {
    var cellType:SimulationViewContentCell.Type { get }
    var cellIdentifier:String { get }
    var cellHeight:CGFloat { get }
}
