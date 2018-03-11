import Foundation

class Entropy {
    let index:Float
    
    var chaos:Float {
        get {
            return self.index
        }
    }
    
    var productivity:Float {
        get {
            let inverseChaos:Float = 1 - self.chaos
            return inverseChaos
        }
    }
    
    init(index:Float) {
        self.index = index
    }
}
