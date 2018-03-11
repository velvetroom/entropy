import Foundation

class Project {
    var name:String
    var start:Date
    var created:Date
    let identifier:String
    let entropy:Entropy
    
    init(identifier:String, entropy:Float) {
        self.entropy = Entropy(index:entropy)
        self.identifier = identifier
        self.name = String()
        self.created = Date()
        self.start = Date()
    }
}
