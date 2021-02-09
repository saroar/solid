import UIKit

// The Single Responsibility Principle
print("The Single Responsibility Principle ------- \n")
let book = Book(id: "1", name: "SwiftUI", author: "Saroar")
let book1 = Book(id: "2", name: "UIKit", author: "Dmitriy")
let book2 = Book(id: "3", name: "Obj-c", author: "Sergei")

var li = LibraryImplementation()
let b = li.addNewBook(book: book)
let b1 = li.addNewBook(book: book1)
let b3 = li.addNewBook(book: book2)
_ = li.deleteBook(id: book.id)

print(li)
print("\n")

// The Open Closed Principle
print("The Open Closed Principle ----------\n")
let apple = Product("Apple", .green, .small)
let tree = Product("Tree", .green, .large)
let house = Product("House", .blue, .large)

let products = [apple, tree, house]

let productFilter = ProductFilter()
print("Green products:")
for product in productFilter.filter(products, ColorSpecification.init(.green)) {
  print("- \(product.name) is green")
}

print("Large blue items")
for product in productFilter.filter(products,
  AndSpecification(
    ColorSpecification(.blue),
    SizeSpecification(.large)
  )) {
  print("- \(product.name) is large and blue")
}
print("\n")

// Liskov subtitution principle - Child class cant change parent class
print("Liskov Subtitution Principle ------------\n")
let eagle = Eagle(flySpeed: 50.0, name: "Eagle")
let penguin = Penguin(swimSpeed: 40.0, name: "Penguin")

print("Eagle flyspeed: \(eagle.flySpeed)\nPenguin swiming speed: \(penguin.swimSpeed)")

print("\n")

// The Interface Segregation Principle

print("The Interface Segregation Principle ----------\n")
let op = OrdinaryPrinter()
let pc = Photocopier()

op.prnt(d: Document())
pc.prnt(d: Document())
pc.scan(d: Document())

print("")
print("The Principle ----------\n")
let order = Order(amount: 40.3, description: "Tea should be hot", createdAt: "today")
//let handler = Handler(database: OderDatabaseOperations()) broken rules one
let handler = Handler(orderStorage: OderDatabaseOperations())
handler.saveOrder(order: order)
