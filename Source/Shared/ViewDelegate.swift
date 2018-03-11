import UIKit

protocol ViewDelegate:AnyObject {
    func draw(rect:CGRect, context:CGContext)
}
