// Create a Struct with Properties: firstName, lastName, fullname, (private) birthday, and age
import Foundation
struct Student{
    //Stored Properties
    var firstName:String
    var lastName:String
    var studentID:String
    
    var year:Int
    var month:Int
    var day:Int
    
    var _password:String? {  // optional binding
        didSet{
            print("Your password was changed from \(oldValue) to \(_password!)")
        }
    }
    
    // Computed Properties
    var fullName:String { return "\(firstName) \(lastName)"}
    var birthdate:String { return "Your birthday is \(month)/\(day)/\(year) " }
    var age:Int {
        get
        {
            let date = Date()
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            let dateYear = df.string(from: date)
            
            if let dateYear = Int(dateYear)
            { return dateYear - year}
         return 0
        }
    }
    var password:String {
        get
        {
            // Password has been set
            if let _password = _password { return _password }
            
            // Provide initial, temporary password
            let last4 = studentID.suffix(4)
            return "\(lastName)\(last4)"
        }
        set{
            _password = newValue
        }
    }
}

var Ian = Student(firstName: "Ian", lastName:"Bansenauer", studentID: "920111123",
                  year: 1989, month: 11, day: 08, _password: nil)

print("Initial password: " + Ian.password)
//Set Password
Ian.password = "testPassword"
Ian.password = "Fabul0_346"
print("Ian's age is \(Ian.age)")
print(Ian.birthdate)
