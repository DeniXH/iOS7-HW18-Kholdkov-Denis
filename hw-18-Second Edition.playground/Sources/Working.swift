import Foundation

// MARK: Working class realization

final public class Working: Thread {
    private var count = 0
    private var storagePlace: StoragePlace
    
    public init(storagePlace: StoragePlace) {
        self.storagePlace = storagePlace
    }
    
    public override func main() {
        while count < 10 {
            storagePlace.pushSynchronise()
        }
    }
}
