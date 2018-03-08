import Foundation

public extension CoredataProject {
    public override func awakeFromInsert() {
        self.created = Date()
        self.start = self.created
        self.name = String.localizedCoredata(key:"CoredataProject_name")
    }
}
