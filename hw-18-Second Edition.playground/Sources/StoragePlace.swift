import Foundation

// MARK: Storage place realization

final public class StoragePlace: Thread {
    private var chipStorage: Stack<Chip>
    private var isAvailable = false
    private var condition = NSCondition()
    private var count = 0
    
    public init(chipStorage: Stack<Chip>) {
        self.chipStorage = chipStorage
    }
    
    public func popSynchrohize() {
        condition.lock()
        isAvailable = true
        chipStorage.push(Chip.make())
        count += 1
        print("from Generating Thread - \(count)")
        print("after sleep")
        condition.signal()
        condition.unlock()
    }
    
    public func pushSynchronise() {
        condition.lock()
        while !isAvailable {
            condition.wait()
        }
        isAvailable = false
        guard let chip = chipStorage.pop() else { return }
        print("from Working Thread - \(count)")
        chip.sodering()
        condition.unlock()
    }
}
