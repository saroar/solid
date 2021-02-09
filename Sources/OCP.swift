import Foundation

// open for extension and close for modification

public enum Color {
  case red
  case green
  case blue
}

public enum Size {
  case small
  case medium
  case large
  case yuge
}

public class Product {
  public var name: String
  public var color: Color
  public var size: Size

  public init(_ name: String, _ color: Color, _ size: Size) {
    self.name = name
    self.color = color
    self.size = size
  }
}

// Specification

public protocol Specification {
  associatedtype T
  func isSatisfied(_ item: T) -> Bool
}

public protocol Filter {
  associatedtype T
  func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T] where Spec.T == T
}

public class ColorSpecification: Specification {

  public typealias T = Product
  let color: Color
  
  public init(_ color: Color) {
    self.color = color
  }

  public func isSatisfied(_ item: Product) -> Bool {
    return item.color == color
  }
}

public class SizeSpecification: Specification {

  public typealias T = Product
  let size: Size
  
  public init(_ size: Size) {
    self.size = size
  }

  public func isSatisfied(_ item: Product) -> Bool {
    return item.size == size
  }
}

public class AndSpecification<T,
  SpecA: Specification,
  SpecB: Specification> : Specification where SpecA.T == SpecB.T, T == SpecA.T, T == SpecB.T {
    
  public let first: SpecA
  public let second: SpecB
  
  public init(_ first: SpecA, _ second: SpecB) {
    self.first = first
    self.second = second
  }
  
  public func isSatisfied(_ item: T) -> Bool {
    return first.isSatisfied(item) && second.isSatisfied(item)
  }
}

public class ProductFilter: Filter {
  
  public typealias T = Product

  public init() {}
  
  public func filter<Spec: Specification>(
    _ items: [Product],
    _ spec: Spec) -> [T] where Spec.T == T {
      
    var result = [Product]()
    for item in items where spec.isSatisfied(item) {
      result.append(item)
    }
    
    return result
  }
  
  
}
