# iOS interview questions
I am listing down some of the repetitive interview questions I have been facing these days. I don't know how I was evaluated by answering these questions. But somehow these are the messages from the gods.

## 1. What is NSManagedObject?
> My Answer: 

> NSManagedObject is the representation of Core Data Entity. Which holds attributes and relationships.

> Expected Answer

> A managed object has an associated entity description (`NSEntityDescription`) that provides metadata about the object, including the name of the entity that the object represents and the names of its attributes and relationships. A managed object also has an associated managed object context that tracks changes to the object graph.

> You can’t use instances of direct subclasses of `NSObject`, or any other class that doesn’t inherit from `NSManagedObject`, with a managed object context. You may create custom subclasses of `NSManagedObject`, although this isn’t always necessary. If you don’t need custom logic, you can create a complete object graph with `NSManagedObject` instances.

> If you instantiate a managed object directly, you must call the designated initializer `init(entity:insertInto:)`.

Read the documentation [here](https://developer.apple.com/documentation/coredata/nsmanagedobject) 


## 2. What are Codable, Encodable & Decodable?
## 3. Difference between struct and class?
## 4. What is the difference between Any & AnyObject
## 5. What is multiplier?
## 6. How to make three different network calls and how to make forth network call upon completion of the first three calls?
> While answering I asked the interviewer: Should the first three network calls to be serial or concurrent, Interviewer replied "anything is fine"
> I started answering while coding it. We can use Tasks/ TaskGroup/ DispatchGroup
> Given the example with Tasks & DispatchGroup

Approach 1
``` swift
func download(file name: String) async throws -> String {
    try await Task.sleep(nanoseconds: 100_000)
    print(name)
    return name
}

func test() {
Task {
    async let task1 = download(file: "File 1")
    async let task2 = download(file: "File 2")
    async let task3 = download(file: "File 3")

    _ = try? await [task1, task2, task3]
    _ = try? await download(file: "File 4")
}
}

test()
```

Approach 2
```swift
let group = DispatchGroup()

group.enter()
serviceCall(num: 10) { data in
    print(data)
    group.leave()
}

group.enter()
serviceCall(num: 11) { data in
    print(data)
    group.leave()
}

group.enter()
    serviceCall(num: 12) { data in
        print(data)
        group.leave()
    }


group.notify(queue: DispatchQueue.main) {
    serviceCall(num: 13) { data in
        print(data)
        group.leave()
    }
}


func serviceCall(num: Int, success: @escaping((String) -> Void)) {
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2), execute: {
        success("Call \(num)")
    })
}
```

## 7. How to write test cases for network calls?
> I didn't answer properly

> One best way is
> Write the service class in testable manner
> We need to create MockProtocol conforming to URLProtocol
> Impletement startLoading method im MockProtocol to verify the URL and trigger custom requestHandler

Please refer this [example](https://blog.devgenius.io/unit-test-networking-code-in-swift-without-making-loads-of-mock-classes-74489d0b12a8)
## 8. What is Layer?
## 9. When two buttons are placed in a view one overlaps the other, how to prevent the touch of the button underneath?
## 10. Find second largest from the given array
## 11. Two sum check from the given array

## 12. What are the uses of extensions?
> My lazy answer:

> Extensions are used
>1.  in `protocol`s to give default implementation to the methods in them.
>2. in `struct` or `class` to write convenience initializers.

> I thought my interviewer would accept that I know them and I used them.
## 13. What is category?
## 14. What are atomic and nonatomic? Which one is thread safe?
> My lazy answer:

> atomic and nonatomic are used to mark the properties in Objective-C classes. atomic is the static and nonatomic is the dynamic. atomic being thread safe.

> I thought my interviewer would accept that I know them and I used them.
## 15. What are the differences between Swift 4 or Swift 5?
## 16. What kind of crashes you faced in your apps?
## 17. What is difference between weak and unowned?
> My answer:

> weak and unowned are used to mark a reference typed stored property in a class to avoid strong referencing. If class A holds a reference of class B and vice versa, in such cases both the objects would never be deallocated even though the scope is closed as they are holding strong references each other. To avoid the memory leakage, we can mark the reference variables as either weak or unowned. weak is used in cases of the property is optional and unowned can be used in both non-optional and optional variable.

> weak and unowned should be carefully chosen. If you are certain that both the references can be deallocated at the same time.

> I don't know the ideal answer.
## 18. What is optional chaining and optional binding?
## 19. What is content hugging and compression resistance?
## 20. What is `@escaping` closure?
> My answer:

> `@escaping` make the closure to hold it's refernce in the memory so that an asynchronous call still call the closure even after the enclosed method completes its return.

> Example I gave that the network calls with completion handler would require an `@escaping` closure.

> May be the interviewer was expecting hear the differences of `@escaping` and `nonescaping` closures. He might have expected me to say that the closures in the function parameters are nonescaping by default. May be he was wanting to know that I know that there used to be `@escaping` closures by default until Swift 3. Now it is reversed.

> I don't know, may be he is looking for Swiftclopedia.
## 21. How to write test cases for UIViewControllers?
## 22. Reverse a string.
``` swift
let name = "Jagan Kumar Mudila"
print(String(name.reversed()))
```
