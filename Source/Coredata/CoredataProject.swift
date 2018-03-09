import Foundation

extension CoredataProject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = Date()
        self.start = self.created
        self.name = String.localizedCoredata(key:"CoredataProject_name")
    }
}
