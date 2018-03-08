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
    
    internal func load<Entity:NSManagedObject>(request:NSFetchRequest, completion:@escaping(([Entity]) -> ())) {
        guard
            
            let objectType:NSManagedObject.Type = T.self as? NSManagedObject.Type
            
            else
        {
            return
        }
        
        let fetchRequest:NSFetchRequest<NSManagedObject> = DatabaseProviderCoreData.factoryFetchRequest(
            entityName:objectType.entityName,
            limit:limit,
            predicate:predicate,
            sorters:sorters)
        
        self.managedObjectContext?.perform
            {
                let data:[NSManagedObject]?
                
                do
                {
                    data = try self.managedObjectContext?.fetch(fetchRequest)
                }
                catch
                {
                    return
                }
                
                guard
                    
                    let results:[T] = data as? [T]
                    
                    else
                {
                    return
                }
                
                completion(results)
        }
    }
    
    func deleteObject(
        object:NSManagedObject,
        completion:(() -> ())?)
    {
        self.managedObjectContext?.perform
            {
                self.managedObjectContext?.delete(object)
                completion?()
        }
    }
    
    
    internal func save(completion:(() -> ())) {
        guard
            let hasChanges:Bool = self.managedObjectContext?.hasChanges,
            hasChanges == true
        else {
            completion()
            return
        }
        
        self.managedObjectContext?.perform
            {
                do
                {
                    try self.managedObjectContext?.save()
                }
                catch let error
                {
                    assertionFailure(error.localizedDescription)
                    
                    return
                }
                
                completion?()
        }
    }
    
    
}
