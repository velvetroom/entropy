import Foundation

class Entropy {
    let index:Float
    
    var chaos:Float {
        get {
//            return self.index
            return 0.65
        }
    }
    
    var productivity:Float {
        get {
            let inverseChaos:Float = 1 - self.chaos
//            return inverseChaos
            return 0.35
        }
    }
    
    init(index:Float) {
        self.index = index
    }
}
