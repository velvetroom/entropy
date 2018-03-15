import UIKit

class SimulationControllerContentProjectName:NSObject, UITextFieldDelegate {
    weak var project:Project?
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
