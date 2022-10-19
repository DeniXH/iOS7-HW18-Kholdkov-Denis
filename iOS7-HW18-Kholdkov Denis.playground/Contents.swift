import UIKit

// MARK: - initial struct from home work

var count = 10

public struct Chip {
    public enum ChipType: UInt32 {
        case small = 1
        case medium
        case big
    }

    public let chipType: ChipType

    public static func make() -> Chip {
        guard let chipType = Chip.ChipType(rawValue: UInt32(arc4random_uniform(3) + 1)) else {
            fatalError("Incorrect random value")
        }
        return Chip(chipType: chipType)
    }

    public func sodering() {
        let soderingTime = chipType.rawValue
        sleep(UInt32(soderingTime))
    }
}

// MARK: - stack realization

struct Stack<Element> {
    fileprivate var array: [Element] = []

    mutating func push(_ element: Element) {
        array.append(element)
    }
    mutating func pop() -> Element? {
        return array.popLast()
    }
}

// MARK: - creation entity of Stack

var threadStack = Stack<Chip>()

// MARK: - create class with realization Thread

class Generating: Thread {

    override func main() {
        semaphore.wait()
        threadStack.push(Chip.make())
        count -= 1
        print("from Generating Thread - \(count)")
        Generating.sleep(forTimeInterval: 2)
        print("after sleep")
        semaphore.signal()
    }
}

class Working: Thread {

    override func main() {
        semaphore.wait()
        guard let chip = threadStack.pop() else { return }
        print("from Working Thread - \(count)")
        chip.sodering()
        semaphore.signal()
    }
}

let semaphore = DispatchSemaphore(value: 2)
var working = Working()
var generating = Generating()

// MARK: - Main Cicle

while (count > 0) {
    working.main()
    generating.main()
}

working.isFinished
generating.isFinished
