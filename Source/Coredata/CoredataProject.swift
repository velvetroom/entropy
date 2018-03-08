import Foundation

public extension CoredataProject {
    public override func awakeFromInsert() {
        self.created = Date()
    }
}
