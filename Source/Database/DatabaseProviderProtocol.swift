import Foundation

protocol DatabaseProviderProtocol {
    func loadProfile(found:@escaping((Profile) -> ()), notFound:@escaping(() -> ()))
    func createProfile(completion:@escaping((Profile) -> ()))
    func loadProject(identifier:String, found:@escaping((Project) -> ()), notFound:@escaping(() -> ()))
    func createProject(completion:@escaping((Project) -> ()))
    func save(project:Project, completion:@escaping(() -> ()))
}
