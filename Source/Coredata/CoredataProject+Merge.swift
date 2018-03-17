import Foundation

extension CoredataProject {
    func merge(project:Project) {
        guard
            project.identifier == self.identifier
        else {
            return
        }
        self.name = project.name
        self.start = project.start
        self.entropy = project.entropy.index
    }
}
