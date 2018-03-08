import Foundation
import CoreData

internal final class DatabaseProviderCoredata:DatabaseProviderProtocol {
    private let context:NSManagedObjectContext
    
    internal init(bundle:Bundle = Bundle.main) {
        self.context = DatabaseProviderCoredata.factoryContext(bundle:bundle)
    }
    
    internal func create<Entity:NSManagedObject>(completion:@escaping((Entity) -> ())) {
        self.context.perform { [weak self] in
            self?.performCreate(completion:completion)
        }
    }
    
    private func performCreate<Entity:NSManagedObject>(completion:((Entity) -> ())) {
        guard
            let description:NSEntityDescription = NSEntityDescription.entity(forEntityName:Entity.name, in:self.context),
            let entity:Entity = NSManagedObject(entity:description, insertInto:self.context) as? Entity
        else {
            return
        }
        completion(entity)
    }
    
    internal func load<Entity:NSManagedObject>(request:NSFetchRequest<Entity>, completion:@escaping(([Entity]) -> ())) {
        self.context.perform { [weak self] in
            self?.performLoad(request:request, completion:completion)
        }
    }
    
    private func performLoad<Entity:NSManagedObject>(request:NSFetchRequest<Entity>, completion:(([Entity]) -> ())) {
        let data:[NSManagedObject]
        do {
            data = try self.context.fetch(request)
        } catch {
            return
        }
        if let results:[Entity] = data as? [Entity] {
            completion(results)
        }
    }
    
    internal func delete(entity:NSManagedObject, completion:@escaping(() -> ())) {
        self.context.perform { [weak self] in
            self?.context.delete(entity)
            completion()
        }
    }
    
    internal func save(completion:@escaping(() -> ())) {
        guard
            self.context.hasChanges == true
        else {
            completion()
            return
        }
        self.context.perform { [weak self] in
            do {
                try self?.context.save()
            } catch let error {
                assertionFailure(error.localizedDescription)
            }
            completion()
        }
    }
}
