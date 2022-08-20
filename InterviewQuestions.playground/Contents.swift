import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = false
//We can use Tasks/ TaskGroup/ DispatchGroup

func download(file name: String) async throws -> String {
    try await Task.sleep(nanoseconds: 10)
    print(name)
    return name
}

func test1() {
    Task {
        async let task1 = download(file: "File 1")
        async let task2 = download(file: "File 2")
        async let task3 = download(file: "File 3")

        _ = try? await [task1, task2, task3]
        _ = try? await download(file: "File 4")
    }
}

func test2() {
    Task {
        _ = try? await download(file: "File 1")
        _ = try? await download(file: "File 2")
        _ = try? await download(file: "File 3")
        _ = try? await download(file: "File 4")
    }
}

test1()
test2()
