// TASK - 1
var boys: [String] = ["Вася", "Петя"]
var girls: [String] = ["Валя", "Юля", "Оля"]
var students: [String] = []
for boy in boys{
    students.insert(boy, at: students.endIndex)
}
for girl in girls{
    students.insert(girl, at: students.endIndex)
}
print(students.joined(separator: " "))

// TASK - 2
students.sort()
print(students.joined(separator: " "))

// TASK - 3
var A: [Int] = [1, -777, -123, 56, 222, -9, 0, -555, 666]
A.sort(by: >)
print(Array(A.map({ String($0)})).joined(separator: " "))
A.filter({$0 > 0}).forEach({ print($0, terminator: " ")})
print()

// TASK - 4
var arr: [Int] = [1, 2, 3, 4, 7, 8, 15]
for i in 0..<(arr.count - 1){
    for j in (i + 1)..<(arr.count){
        if arr[i] + arr[j] == 6{
            print(i, j)
        }
    }
}
