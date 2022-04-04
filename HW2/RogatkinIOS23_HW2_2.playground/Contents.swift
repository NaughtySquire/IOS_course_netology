let january: String = "Январь"
let february: String = "Февраль"
let march: String = "Март"
let april: String = "Апрель"
let may: String = "Май"
let june: String = "Июнь"
let july: String = "Июль"
let august: String = "Август"
let september: String = "Сентябрь"
let october: String = "Октябрь"
let november: String = "Ноябрь"
let december: String = "Декабрь"
var selectedMouth: String = february

// TASK - 1
if selectedMouth == "Январь"{
    print("В январе \(31 - 16) рабочих дней.")
}else if selectedMouth == "Февраль"{
    print("В феврале \(28 - 9) рабочих дней.")
}else if selectedMouth == "Март"{
    print("В марте \(31 - 9) рабочих дня.")
}else if selectedMouth == "Апрель"{
    print("В Апреле \(30 - 8) рабочих дня.")
}else if selectedMouth == "Май"{
    print("В Мае \(31 - 9) рабочих дня.")
}else if selectedMouth == "Июнь"{
    print("В Июне \(30 - 9) рабочих дня.")
}else if selectedMouth == "Июль"{
    print("В Июле \(31 - 8) рабочих дня.")
}else if selectedMouth == "Август"{
    print("В Августе \(31 - 8) рабочих дня.")
}else if selectedMouth == "Сентябрь"{
    print("В Сентябре \(30 - 8) рабочих дня.")
}else if selectedMouth == "Октябрь"{
    print("В Октябре \(31 - 8) рабочих дня.")
}else if selectedMouth == "Ноябрь"{
    print("В Ноябре \(31 - 9) рабочих дня.")
}else if selectedMouth == "Декабрь"{
    print("В Декабре \(31 - 8) рабочих дня.")
}

// TASK - 2
switch selectedMouth {
case "Январь":
    print("В январе \(31 - 16) рабочих дней.")
case "Февраль":
    print("В феврале \(28 - 9) рабочих дней.")
case "Март":
    print("В марте \(31 - 9) рабочих дня.")
case "Апрель":
    print("В Апреле \(30 - 8) рабочих дня.")
case "Май":
    print("В Мае \(31 - 9) рабочих дня.")
case "Июнь":
    print("В Июне \(30 - 9) рабочих дня.")
case "Июль":
    print("В Июле \(31 - 8) рабочих дня.")
case "Август":
    print("В Августе \(31 - 8) рабочих дня.")
case "Сентябрь":
    print("В Сентябре \(30 - 8) рабочих дня.")
case "Октябрь":
    print("В Октябре \(31 - 8) рабочих дня.")
case "Ноябрь":
    print("В Ноябре \(31 - 9) рабочих дня.")
case "Декабрь":
    print("В Декабре \(31 - 8) рабочих дня.")
default:
    print("Вы неправильно выбрали месяц.")
    break
}

// TASK - 3
var isHoliday: Bool = true
isHoliday ? print("Это выходной день.") : print("Это рабочий день.")

// TASK - 4
enum Month{
    case january, february, march, april, may, june, july, august, september, october, november, december
    var descriprion: String{
        switch self{
        case .january: return "Январь"
        case .february: return "Февраль"
        case .march: return "Март"
        case .april: return "Апрель"
        case .may: return "Май"
        case .june: return "Июнь"
        case .july: return "Июль"
        case .august: return "Август"
        case .september: return "Сентябрь"
        case .october: return "Октябрь"
        case .november: return "Ноябрь"
        case .december: return "Декабрь"
        }
    }
}

print(Month.february.descriprion)
