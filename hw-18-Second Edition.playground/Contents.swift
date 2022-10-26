import Foundation

// MARK: - Create Entities

var chipStorage = Stack<Chip>()
var storagePlace = StoragePlace(chipStorage: chipStorage)
var generating = Generating(storagePlace: storagePlace)
var working = Working(storagePlace: storagePlace)

// MARK: - Start threads

working.start()
generating.start()

// MARK: Stop threads

working.cancel()
generating.cancel()
