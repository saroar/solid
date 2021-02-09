import Foundation

// each class have only single job 

public struct Book {
  public let id: String
  public let name: String
  public let author: String
  
  public init(id: String, name: String, author: String) {
    self.id = id
    self.name = name
    self.author = author
  }
}

extension Book: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Book: Equatable {
  public static func == (lhs: Book, rhs: Book) -> Bool {
    return lhs.id == rhs.id
  }
}

extension Book: CustomStringConvertible {
  public var description: String {
    return "ID: \(id) name: \(name) Author: \(author)"
  }
}

public protocol Library {
  /**
   Adds a new book object to the Library.
   - Parameter book: book to add to the Library
   - Returns: false if the book with same id already exists in the Library, true – otherwise.
   */
  func addNewBook(book: Book) -> Bool
  
  /**
   Deletes the book with the specified id from the Library.
   - Returns: true if the book with same id existed in the Library, false – otherwise.
   */
  func deleteBook(id: String) -> Bool
  
  /**
   - Returns: 10 book names containing the specified string.
   If there are several books with the same name, author's name is added to book's name in the format "<author> - <book>",
   otherwise returns simply "<book>".
   */
  func listBooksByName(searchString: String) -> Set<String>
  
  /**
   - Returns: 10 book names whose author contains the specified string,
   result is ordered by authors.
   */
  func listBooksByAuthor(searchString: String) -> [String]
}

public class LibraryImplementation: Library, CustomStringConvertible {
    
  private var books = Set<Book>()
  
  public init() {}
  
  public func addNewBook(book: Book) -> Bool {
    return books.insert(book).inserted
  }
  
  public func deleteBook(id: String) -> Bool {
    if let index = books.firstIndex(where: { $0.id == id }) {
      books.remove(at: index)
      return true
    } else {
      return false
    }
  }
  
  public func listBooksByName(searchString: String) -> Set<String> {
    let result = books
      .filter { $0.name == searchString }
      .map { $0.name }
    return Set(result)
  }
  
  public func listBooksByAuthor(searchString: String) -> [String] {
    let arrayOfBooks = books
      .filter {  $0.author.contains(searchString) }
      .map { $0.author }
    
    return arrayOfBooks
  }
  
}

extension LibraryImplementation {
  public var description: String {
    
    return "Books list \n\(books.map { $0.description }.joined(separator: "\n") )"
    
  }
}
