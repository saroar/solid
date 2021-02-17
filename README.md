# S.O.L.I.D
#### Check and play with playground code 

# The Single Responsibility Principle
  Each class/model have only single Responsibility 
# The Open Closed Principle
  Open for extension and close for modification
# The Liskov Substitution Principle
  Child class/subclass cant be change/ are not allow anything of parent class/ super class.  
  Any class should be able to be replaced by one of its subclasses without affecting its functioning.
# The Interface Segregation Principle
  The Principle of segregation of the interface indicates that it is better to have different interfaces (protocols) that are specific to each client

# The Dependency Inversion Principle
<details>
<summary>
  High level classes should not depend on low level classes. Both should depend on abstractions.  
  Abstractions should not depend on the details. The details should depend on the abstractions.
</summary>
<br><br>
  
```swift
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
```

</details>
