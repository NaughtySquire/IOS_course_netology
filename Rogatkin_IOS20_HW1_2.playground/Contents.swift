// TASK - 1
enum Chessmen{
    case pawn, knight, bishop, rook, queen, king
}

class Image{
    var width, height: Int
    var numberOfColors: Int
    var pixels: [Int]
    func show(){}
    func change(){}
    func delete(){}
    func create(){}
}

struct Resume{
    var photo: Image
    var desscription: String
    var age: Int
    var expirience: [String: [String: Int]]
}
// TASK - 2
/*
 агрегация:
    корпус - стержень. Если сломать корпус ручки, стержень останется цел.
    автор - идея. "Нас учат помнить не человека, а идею. Ибо человек слаб. Его могут поймать, его могут убить и предать забвению. Но идея и четыреста лет спустя способна изменить мир."

 композиция:
    холст - картина. Если порвать холст, то и картина на нем тоже перестанет существовать.
    накопитель - данные. Если сломать накопитель данных, то и данные с него тоже не получится получить.
 */
