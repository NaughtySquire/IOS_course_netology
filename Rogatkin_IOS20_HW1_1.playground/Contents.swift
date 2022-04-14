// TASK - 1
/*
 Пусть мы хотим создать некоторую РПГ-игру. Конечно же в этой игре есть враги - протокол Enemy - . Первый тип врагов - орки (куда же без них?) - класс Orc. От любых врагов орки отличаются тем, что могут входить в ярость. Помимо обычных орков существуют также маги и шаманы орков - классы OrcMage и OrcShaman. Маги орков могут в дополнение к способностям орков применять заклинания, а шаманы лечить союзников.

 Получается следуюющие примеры:
    Абстракция - протоколы: Enemy и Moveable

    Инкапсуляция - все функции?? Они ведь все в той или иной мере работают с переменными при этом скрывая логику работы от пользователей.

    Наследование - OrcMage и OrcShaman наследуют свойства и методы класса Orc.

    Полиморфизм - подписчики?? протокола Moveable. Они могут передвигаться, но каждый делает это по разному.
                - подписчики протокола Enemy. Игровой персонаж может атаковать любого врага вне зависимости от его класса.

 */
protocol Enemy{
    var hitPoints: Int {get}
    func attack()
    func getDamage(damage: Int)
}

protocol Moveable{
    func move()
}

class Orc: Enemy, Moveable{
    var health: Int = 100
    lazy var hitPoints: Int = health // + еще что-нибудь
    func move() {}
    func attack() {}
    func getDamage(damage: Int) {}
    func rage(){}
}

class OrcMage: Orc{
    func castSpell(){}
}

class OrcShaman: Orc{
    func heal(enemy: inout Enemy){}
}

protocol PlayableCharacter: Moveable{

    func attack(enemy: Enemy)
    func move()
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

class Bracer{
    var armor: Int
    var cost: Int
    init(armor: Int, cost: Int){
        self.armor = armor
        self.cost = cost
    }
    func putOn(){}
    func sell(){}
}
class Shield{
    var blockPerscent: Int
    var weight: Int
    init(blockPercent: Int, weight: Int){
        self.blockPerscent = blockPercent
        self.weight = weight
    }
    func block(){}
    func putInBackpack(){}
}

class Sword{
    var damage: Int
    var durablity: Int
    init(damage: Int, durability: Int){
        self.damage = damage
        self.durablity = durability
    }
    func hit(){}
    func repair(){}
}

var leatherBracer: Bracer = Bracer(armor: 5, cost: 1)
var woodenShield: Shield = Shield(blockPercent: 75, weight: 3)
var obsidianSword: Sword = Sword(damage: 50, durability: 20)
