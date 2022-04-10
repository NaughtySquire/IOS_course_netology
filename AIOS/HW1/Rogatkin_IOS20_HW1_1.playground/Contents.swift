// TASK - 1
protocol PutOn{
    func putOn()
    func takeOff()
}

protocol Enchantable{
    func enchant(rune: Rune)
}

protocol Thing{
    func take()
    func put()
    func inspect()
}

class Rune: Thing{
    func take() {}
    func put() {}
    func inspect() {}
}

class Bracer: PutOn, Thing, Enchantable{
    func putOn() {}
    func takeOff() {}
    func enchant(rune: Rune){}
    func take() {}
    func put() {}
    func inspect() {}

}

// TASK - 2
/*
 Класс: Наруч, Щит, Меч
 Объект: кожаныйНаруч, деревянныйЩит, обсидиановыйМеч
 Свойства:
    Меч: урон, прочность
    Щит: блокируемыйУрон, вес
    Наруч: количествоБрони, стоимость,
 Методы:
    Меч: ударить(), починить()
    Щит: блокировать(), положитьВРюкзак()
    Наруч: надеть(), продать()
 */
