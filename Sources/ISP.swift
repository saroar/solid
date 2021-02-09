import Foundation

// The Principle of segregation of the interface indicates that it is better to have different interfaces (protocols) that are specific to each client
//Клиенты не должны зависить от методов, которые они не используют.
//Много специализированных интерфейсов лучше, чем один универсальный.

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
