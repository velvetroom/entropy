import Foundation

class Project {
    var name:String
    var start:Date
    var created:Date
    let identifier:String
    
    init(identifier:String) {
        self.identifier = identifier
        self.name = String()
        self.created = Date()
        self.start = Date()
    }
}
