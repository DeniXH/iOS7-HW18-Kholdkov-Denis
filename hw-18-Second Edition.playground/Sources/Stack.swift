import Foundation

// MARK: - stack realization

public struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    public init(){}
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    mutating func pop() -> Element? {
        return array.popLast()
    }
}
