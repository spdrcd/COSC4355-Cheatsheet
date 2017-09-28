import Foundation

// 1. Declare a variable called "string" that holds the value "my string" [0.5]
var myString = "my string"

// 2. Print the length of "string" [0.5]
myString.characters.count

// 3. Print the first character in "string" [0.5]
myString.characters.first

// 4. Print the 4th character in "string" [0.5]
//string[string.startIndex.advancedBy(3)]
myString[myString.index(myString.startIndex, offsetBy: 3)]

// 5. Print the first 3 characters in "string" [1]
//var idx =
myString.substring(to: myString.index(myString.startIndex, offsetBy: 3))

// 6. Create an array that contains "a", "b", "c", called "array" [0.5]
let array = ["a", "b", "c"]

// 7. Get the length of "array" [0.5]
array.count

// 8. Get the 2nd item in array [0.5]
array[1]

// 9. Print "long" if the length of array is more than 5, else print "short" [0.5]
if array.count > 5 {
    "long"
}
else {
    "short"
}

/* 10.
 
 Create a library system which contains a list of books. [See below for list of books]
 A Book has three attributes, a 13- Digit ISBN number, a title.
 
 // LIST OF BOOKS:
 
 978-0134390734, iOS Programming: The Big Nerd Ranch Guide (5th Edition)
 978-0321942067, Objective-C Programming: The Big Nerd Ranch Guide
 978-0262514279, Seeing: The Computational Approach to Biological Vision
 978-0521149709, The Phonological Mind
 978-0553418026, The Martian
 978-0393350395, Origins: Fourteen Billion Years of Cosmic Evolution
 978-0956372857, Information Theory: A Tutorial Introduction
 978-1405191470, Fundamentals of Psycholinguistics
 978-0781760034, Neuroscience: Exploring the Brain
 978-0321644688, Calculus For Biology and Medicine
 
 */

class Book {
    let isbn: String
    let title: String
    init(id: String, name: String) {
        isbn = id
        title = name
    }
}

class Library {
    var books: [Book]
    init(list : [Book])
    {
        books = list
    }
    func addBook(book: Book) -> [Book] {
        books.append(book)
        return books
    }
    
    func removeBook(isbn: String) -> [Book] {
        for index in 0..<books.count {
            if books[index].isbn == isbn {
                books.remove(at: index)
                break
            }
        }
        return books
    }

    func getBooksWith(phrase: String) -> [Book] {
        var list = [Book]()
        for book in books {
            if book.title.lowercased().contains(phrase.lowercased()) {
                list.append(book)
            }
        }
        return list
    }
    
    func getBooksAndCount() -> (list: [Book], total: Int) {
        return (books, books.count)
    }
}

let b1 = Book(id: "978-0134390734", name: "iOS Programming: The Big Nerd Ranch Guide (5th Edition")
let b2 = Book(id: "978-0321942067", name: "Objective-C Programming: The Big Nerd Ranch Guide")
let b3 = Book(id: "978-0262514279", name: "Seeing: The Computational Approach to Biological Vision")
let b4 = Book(id: "978-0521149709", name: "The Phonological Mind")
let b5 = Book(id: "978-0553418026", name: "The Martian")
let b6 = Book(id: "978-0393350395", name: "Origins: Fourteen Billion Years of Cosmic Evolution")
let b7 = Book(id: "978-0956372857", name: "Information Theory: A Tutorial Introduction")
let b8 = Book(id: "978-1405191470", name: "Fundamentals of Psycholinguistics")
let b9 = Book(id: "978-0781760034", name: "Neuroscience: Exploring the Brain")
let b10 = Book(id: "978-0321644688", name: "Calculus For Biology and Medicine")

let list = [b1, b2, b3, b4, b5, b6, b7, b8, b9, b10]
let library = Library(list: list)

/* 
 
 11. Call a library function to insert the following book.
 978-1530274376, Swift: Programming [1]
 
 */

library.addBook(book: Book(id: "978-1530274376", name: "Swift: Programming"))

// 12. Call a library function to remove a book. [remove book with ISBN:  978-0321942067] [1]

library.removeBook(isbn: "978-0321942067")

// 13. Call a library function to list all book and the total count of the books [1]
let tuple = library.getBooksAndCount()
tuple.list
tuple.total

// 14. Call a library function to list all the books whose name has the word "programming" [1]
library.getBooksWith(phrase: "programming")

// 15. Sort list of books alphabetically [1]
let sortedBooks = library.books.sorted(by: {(b1, b2) -> Bool in return b1.title < b2.title })
for b in sortedBooks {
    print(b.title)
}

