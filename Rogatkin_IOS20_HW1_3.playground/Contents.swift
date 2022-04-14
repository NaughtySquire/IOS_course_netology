import Darwin
import Foundation

// TASK - 1
struct Homework{
    private(set) var taskLink: URL
    private(set) var description: String
    private(set) var daysToComplete: Int
}

class HomeworkSolver{
    private var homework: Homework
    init(homework: Homework) {
        self.homework = homework
    }
    private func solveHomework() -> FILE {
        let solution: FILE = FILE()
        return solution
    }

    
    public func sendSolution(linkToLoad: URL) -> Void {
        var solution: FILE = solveHomework()
        // ...
    }
}

// TASK - 2

class SomeClass{
    func someMethod(a: Int){ print("someMethod1") }
    func someMethod(a: String){ print("someMethod2") }
    func someMethod(_ a: Int){ print("someMethod3") }
}

var someObj: SomeClass = SomeClass()
someObj.someMethod(a: 0)
someObj.someMethod(a: "0")
someObj.someMethod(0)

// TASK - 3
class Superclass{
    func superclassMethod(){}
}

class Subclass: Superclass{
    override func superclassMethod(){
        super.superclassMethod()
    }
}

