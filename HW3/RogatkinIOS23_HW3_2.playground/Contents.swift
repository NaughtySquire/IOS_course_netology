// TASK - 1
var myThings: (String, Double, String) = (
    "Eternal Sunshine of the Spotless Mind",
    15.5,
    "Картошка с пюрешкой"
)
let (favoriteFilm, favoriteNumber, favoriteDish) = myThings

var herThings: (String, Double, String) = (
    "Terminator",
    777,
    "Картошка с макарошками"
)



var tempThings: (String, Double, String) = herThings
herThings = myThings
myThings = tempThings

var ourNumbers: (Double, Double, Double) = (myThings.1, herThings.1, myThings.1 - herThings.1)

// TASK - 2
var journal: [String: [String: Int]] =  [
    "Вася": ["Физкультура": 5, "Математика": 5, "Астрономия": 5],
    "Петя": ["Программирование": 5, "Духовное краеведение": 5, "Иностранный язык": 5],
    "Маша": ["Физика": 5, "Теология": 5, "Философия": 5]
]

// TASK - 3
typealias Chessman = [String: (alpha: Character, num: Int)?]
var Chessmans: Chessman = [
    "Белый король": ("1", 1),
    "Черный король": ("2", 2),
    "Черно-белый король": nil
]
if let chessPieceCoords = Chessmans["Черный король"]{
    print("Черный король:", chessPieceCoords!.alpha, chessPieceCoords!.num)
}else{
    print("На игровом поле такой фигуры нет.")
}

// TASK - 4
for (chessPieceName, chessPieceCoords) in Chessmans{
    print(chessPieceName, ": ", chessPieceCoords ?? "на игровом поле такой фигуры нет.", separator: "")
}
