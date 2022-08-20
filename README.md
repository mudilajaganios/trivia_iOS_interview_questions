# iOS interview questions
I am listing down some of the repetitive interview questions I have been facing these days. I don't know how I was evaluated by answering these questions. But somehow these are the messages from the gods.

## 1. What is NSManagedObject?
> My Answer: 

> NSManagedObject is the representation of Core Data Entity. Which holds attributes and relationships.

> Expected Answer

> A managed object has an associated entity description (NSEntityDescription) that provides metadata about the object, including the name of the entity that the object represents and the names of its attributes and relationships. A managed object also has an associated managed object context that tracks changes to the object graph.

> You can’t use instances of direct subclasses of NSObject, or any other class that doesn’t inherit from NSManagedObject, with a managed object context. You may create custom subclasses of NSManagedObject, although this isn’t always necessary. If you don’t need custom logic, you can create a complete object graph with NSManagedObject instances.

> If you instantiate a managed object directly, you must call the designated initializer init(entity:insertInto:).

Read the documentation [here](https://developer.apple.com/documentation/coredata/nsmanagedobject) 


## 2. What are Codable, Encodable & Decodable?
## 3. Difference between struct and class?
## 4. What is the difference between Any & AnyObject
## 5. What is multiplier?
## 6. How to make three different network calls and how to make forth network call upon completion of the first three calls?
## 7. How to write test cases for network calls?
## 8. What is Layer?
## 9. When two buttons are placed in a view one overlaps the other, how to prevent the touch of the button underneath?
## 10. Find second largest from the given array
## 11. Two sum check from the given array
## 12. What are the uses of extensions?
## 13. What is category?
## 14. What are atomic and nonatomic? Which one is thread safe?
## 15. What are the differences between Swift 4 or Swift 5?
## 16. What kind of crashes you faced in your apps?
## 17. What is difference between weak and unowned?
## 18. What is optional chaining and optional binding?
## 19. What is content hugging and compression resistance?
## 20. What is @escaping closure?
## 21. How to write test cases for UIViewControllers?
## 22. Reverse the given string.
``` swift
let sampleString = "Jagan Kumar Mudila"
print(String(sampleString.reversed()))
```
