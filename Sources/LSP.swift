import Foundation

// Child class/subclass cant be change/ are not allow anything of parent class/ super class
// Any class should be able to be replaced by one of its subclasses without affecting its functioning.
// Наследующий класс должен дополнять, а не замещать поведение базового класса.

//public class Bird {
//  public var name: String
//  public flySpeed: Double
//
//  init(name: String) {
//    self.name = name
//  }
//}
//
//class Eagle: Bird { } all is good
//class Penguin: Bird {} here is broken Liskov subtitution principle
// Penguin cant fly but can swim

public protocol CanFly {
  var flySpeed: Double { get set }
}

public protocol CanSwim {
  var swimSpeed: Double { get set }
}

public class Bird {
  public var name: String

  init(name: String) {
    self.name = name
  }
}

public class Eagle: Bird, CanFly {
  public var flySpeed: Double
  
  public init(flySpeed: Double, name: String) {
    self.flySpeed = flySpeed
    super.init(name: name)
  }
}

public class Penguin: Bird, CanSwim {
  public var swimSpeed: Double
  
  public init(swimSpeed: Double, name: String) {
    self.swimSpeed = swimSpeed
    super.init(name: name)
  }
  
}
