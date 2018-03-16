import UIKit

class SimulationControllerContentProjectName:NSObject, UITextFieldDelegate {
    func textField(_ textField:UITextField, shouldChangeCharactersIn range:NSRange, replacementString string:String) -> Bool {
        guard
            let currentText:String = textField.text,
            let range:Range = Range(range, in:currentText)
        else {
            return true
        }
        
        let updatedText:String = currentText.replacingCharacters(in:range, with:string)
        
        return true
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
