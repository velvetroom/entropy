import Foundation

extension CoredataProject {
    func factoryProject() -> Project? {
        guard
            let identifier:String = self.identifier,
            let name:String = self.name,
            let created:Date = self.created,
            let start:Date = self.start
        else {
            return nil
        }
        let project:Project = Project(identifier:identifier)
        project.name = name
        project.created = created
        project.start = start
        return project
    }
}
