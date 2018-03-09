import Foundation

extension ApplicationPresenter {
    class func factoryPrivateQueue() -> DispatchQueue {
        let queue:DispatchQueue = DispatchQueue(
            label:Constants.queueIdentifier,
            qos:DispatchQoS.userInteractive,
            attributes:DispatchQueue.Attributes(),
            autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.main)
        return queue
    }
}
