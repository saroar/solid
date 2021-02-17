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
<details>
  <summary>
    The Principle of segregation of the interface indicates that it is better to have different interfaces (protocols) that are specific to each client
    Клиенты не должны зависить от методов, которые они не используют.
    Много специализированных интерфейсов лучше, чем один универсальный.
  </summary>
  
```swift
public class Document {
  public init() {}
}

public protocol Machine {
  func prnt(d: Document)
  func scan(d: Document)
  func fax(d: Document)
} // This is broken Interface Segregation Principle
public class MultiFunPrinter: Machine {
  public func prnt(d: Document) {
    print("Print")
  }
  
  public func scan(d: Document) {
    print("Scan")
  }
  
  public func fax(d: Document) {
    print("Fax")
  }

}

public class OldFashionedPrinter: Machine {
  public func prnt(d: Document) {
    // good
  }
  
  public func scan(d: Document) {
    // unused
  }

  public func fax(d: Document) {
    // unused
  }
}

public protocol Printer {
  func prnt(d: Document)
}

public protocol Scanner {
  func scan(d: Document)
}

public protocol Fax {
  func fax(d: Document)
}

public class OrdinaryPrinter : Printer {
  
  public init() {}
  
  public func prnt(d: Document) {
    // All is good
    print("OrdinaryPrinter cant only print")
  }
}

public class Photocopier : Printer, Scanner {
  
  public init() {}
  
  public func prnt(d: Document) {
    print("Photocopier can print")
  }

  public func scan(d: Document) {
    print("Photocopier can scan")
  }
}

protocol MultiFunctionDevice : Printer, Scanner, Fax {}

public class MultiFunctionMachine : MultiFunctionDevice {
  public let printer: Printer
  public let scanner: Scanner
  public let fax: Fax

  public init(printer: Printer, scanner: Scanner, fax: Fax) {
    self.printer = printer
    self.scanner = scanner
    self.fax = fax
  }

  public func prnt(d: Document) {
    printer.prnt(d: Document())
  }
  
  public func scan(d: Document) {
    scanner.scan(d: Document())
  }
  
  public func fax(d: Document) {
    fax.fax(d: Document())
  }
  
}
```

</details>
# The Dependency Inversion Principle
<details>
<summary>
  High level classes should not depend on low level classes. Both should depend on abstractions.  
  Abstractions should not depend on the details. The details should depend on the abstractions.
</summary>
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
