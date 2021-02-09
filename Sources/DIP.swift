import Foundation

// High level classes should not depend on low level classes. Both should depend on abstractions.
// Abstractions should not depend on the details. The details should depend on the abstractions.

public struct Order {
  public let amount: Double
  public let description: String
  public let createdAt: String
  
  public init(amount: Double, description: String, createdAt: String) {
    self.amount = amount
    self.description = description
    self.createdAt = createdAt
  }
}

public protocol OrderStorage {
  func saveOrder(order: Order)
}

/// high-level this class was broken rules
//public class Handler {
//  private let orderDatabaseOperation: OderDatabaseOperation
//
//  public init(database: OderDatabaseOperation) {
//    self.orderDatabaseOperation = database
//  }
//
//  public func saveOrder(order: Order)  {
//    guard order.amount != 0 else {
//      return
//    }
//
//    // save to database
//    orderDatabaseOperation.saveOrderr(order: order)
//  }
//}

/// high-lavel
public class Handler {
  private let orderStorage: OrderStorage
  
  public init(orderStorage: OrderStorage) {
    self.orderStorage = orderStorage
  }
  
  public func saveOrder(order: Order)  {
    guard order.amount != 0 else {
      return
    }
    
    // save to database
    orderStorage.saveOrder(order: order)
  }
}

// low-level
public class OderDatabaseOperations: OrderStorage {
  
  public init() {}
  
  public func saveOrder(order: Order) {
    // save orders to database
    print("Order: \(order.description) of \(order.amount) saved")
  }
}
