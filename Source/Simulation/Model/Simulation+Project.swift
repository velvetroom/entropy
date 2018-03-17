import Foundation

extension Simulation {
    func updateProject(name:String) {
        self.project?.name = name
        self.saveProject { }
    }
}
