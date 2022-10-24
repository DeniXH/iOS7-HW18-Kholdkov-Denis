import Foundation

// MARK: - create class with realization Thread

final public class Generating: Thread {
    private var count = 0
    private var storagePlace: StoragePlace
    
    public init(storagePlace: StoragePlace) {
        self.storagePlace = storagePlace
    }
    
    public override func main() {
        while count < 10 {
            storagePlace.popSynchrohize()
            count += 1
            Generating.sleep(forTimeInterval: 2)
        }
    }
}
