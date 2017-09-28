# COSC4355-Cheatsheet
cheatsheet for cosc 4355.

# EXCERCISE 1

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
if array.count > 5
{
    "long"
}
else
{
    "short"
}

// 10.

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

class Book {
    let isbn: String
    let title: String
    init(id: String, name: String)
    {
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
    func addBook(book: Book) -> [Book]
    {
        books.append(book)
        return books
    }

    func removeBook(isbn: String) -> [Book]
    {
        for index in 0..<books.count
        {
            if books[index].isbn == isbn
            {
                books.remove(at: index)
                break
            }
        }
        return books
    }

    func getBooksWith(phrase: String) -> [Book]
    {
        var list = [Book]()
        for book in books {
            if book.title.lowercased().contains(phrase.lowercased())
            {
                list.append(book)
            }
        }
        return list
    }

    func getBooksAndCount() -> (list: [Book], total: Int)
    {
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


 11. Call a library function to insert the following book.
 978-1530274376, Swift: Programming [1]


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

#  EXCERCISE 2

###  AppDelegate.swift

import UIKit

class ViewController: UIViewController 
{
    let greetingsDictionary = ["English": "Hello", "Italian": "Ciao", "French": "Bonjour", "Spanish": "Hola", "Dutch": "Hallo", "Greek": "Χαίρετε", "Vietnamese": "xin chào", "Chinese": "你好", "Bangla": "হ্যালো", "Hindi": "नमस्ते"]
    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var txtNameField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showAlert()
    {
        let alert = UIAlertController(title: "Missing Name", message: "Enter your name!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: "Default action"), style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func actionGreetMe(_ sender: Any)
    {
        guard txtNameField.text!.characters.count > 0 else
        {
            showAlert()
            return
        }
        let randomNum = Int(arc4random_uniform(UInt32(greetingsDictionary.count)))
        lblGreeting.text = Array(greetingsDictionary.values)[randomNum] + " " + txtNameField.text!
    }

    @IBAction func actionPickAGreeting(_ sender: Any)
    {
        guard txtNameField.text!.characters.count > 0 else
        {
            showAlert()
            return
        }
        let alert = UIAlertController(title: "Greetings ActionSheet", message: "Pick greeting language", preferredStyle: .actionSheet)
        for (language, value) in greetingsDictionary {
            alert.addAction(UIAlertAction(title: NSLocalizedString(language, comment: "Default action"), style: .default, handler: { _ in
                self.lblGreeting.text = value + " " + self.txtNameField.text!
            }))
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)

    }
}

#  EXCERCISE 3

###  HomeViewController.swift

import UIKit

class HomeViewController: UIViewController
{
    var user:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblName.text = user
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated./Volumes/ubicomp/fall 2016/Week2/Exercise2solution.zip
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func actionLogout(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var lblName: UILabel!
}


###  RegisterViewController.swift

import UIKit

protocol RegisterViewControllerDelegate
{
    func registerViewControllerResponse(username:String, password:String)
}

class RegisterViewController: UIViewController
{
    var delegate: RegisterViewControllerDelegate?

    @IBOutlet weak var txtNewUser: UITextField!
    @IBOutlet weak var txtNewPwd: UITextField!
    @IBOutlet weak var txtConfirmPwd: UITextField!
    @IBOutlet weak var lblError: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool)
    {
        txtNewUser.text = ""
        txtNewPwd.text = ""
        txtConfirmPwd.text = ""
        lblError.text = ""
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        delegate?.registerViewControllerResponse(username: txtNewUser.text!, password: txtNewPwd.text!)
        if segue.identifier == "register2Home"
        {
            let dvc = segue.destination as! HomeViewController
            dvc.user = txtNewUser.text!
        }
    }

    @IBAction func addNewUser(_ sender: Any)
    {

        if (txtNewUser.text != "" && txtNewPwd.text != "" && txtNewPwd.text == txtConfirmPwd.text)
        {
            lblError.text = ""
            performSegue(withIdentifier: "register2Home", sender: self)
        }
        else if (txtNewUser.text == "")
        {
            lblError.text = "Username cannot be empty"
        }
        else if (txtNewPwd.text == "")
        {
            lblError.text = "Password cannot be empty"
        }
        else if (txtNewPwd != txtConfirmPwd)
        {
            lblError.text = "Passwords do not match"
        }
    }
}



#  EXCERCISE 4

###  random function in swift 

//This function returns a random number from 1 - 6

```var randnum = 0
randnum = Int(arc4random_uniform(UInt32(6))) + 1```

###  image outlet and changing images

//image outlet and changing image(s) in outlet (image referenced from name within content folder)

//image outlet declearation -- imageDice1 is name of outlet

```@IBOutlet weak var imgDice1: UIImageView!```

//image for imgDice1 outlet  is changed with “die_face_1” image within content folder

```imgDice1.image = UIImage(named: "die_face_1")```

